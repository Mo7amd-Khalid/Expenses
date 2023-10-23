import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/modules/expense/cubit/state.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/expense_model.dart';

class ExpensesCubit extends Cubit<ExpensesAppStates> {
  ExpensesCubit() : super(InitialExpenseAppState());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  List<Map> expenses = [];
  Database? db;

  void createDataBase() async {
    db = await openDatabase("expenseDB.db", version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE expItem(id INTEGER PRIMARY KEY, title TEXT, amount DOUBLE, category TEXT, date TEXT)')
          .then((value) {
        print("DB created");
        emit(CreateDBExpenseAppSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CreateDBExpenseAppErrorState());
      });
    }, onOpen: (database) {
      getData(database);
      print('DB opened');
    });
  }

  void getData(Database db) {
    emit(GetDataExpenseAppLoadingState());
    expenses = [];
    db.rawQuery('SELECT * FROM expItem').then((value) {
      value.forEach((element) {
        expenses.add(element);
        print(element);
        print("get data");
        emit(GetDataExpenseAppSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(GetDataExpenseAppErrorState());
    });
  }

  void addExp(Expense expense) {
    db!.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO expItem(title, amount, category, date) VALUES ("${expense.title}", ${expense.amount}, "${expense.category.name}", "${expense.expenseDate}" )')
          .then((value) {
        getData(db!);
        emit(InsertDataExpenseAppSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(InsertDataExpenseAppErrorState());
      });
      return Future(() => null);
    });
  }

  void removeExp(int id) {
    db!.transaction((txn) {
      txn.rawDelete('DELETE FROM expItem WHERE id = ?', [id]).then((value) {
        getData(db!);
        emit(DeleteDataExpenseAppSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(DeleteDataExpenseAppErrorState());
      });
      return Future(() => null);
    });
  }


  List<ExpenseBucket> get bucket{
    return [
      ExpenseBucket.fromCategory(category: 'other', expenses: expenses),
      ExpenseBucket.fromCategory(category: 'funny', expenses: expenses),
      ExpenseBucket.fromCategory(category: 'sport', expenses: expenses),
      ExpenseBucket.fromCategory(category: 'work', expenses: expenses),
      ExpenseBucket.fromCategory(category: 'food', expenses: expenses),
    ];
  }

  double get maxAmount{
    double maxAmount = 0;

    for(var ele in expenses){
      if(ele['amount'] > maxAmount) {
        maxAmount = ele['amount'];
      }
    }

    return maxAmount;
  }
}
