import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../expense/cubit/cubit.dart';
import '../expense/cubit/state.dart';
import '../expenseItem/expenseItem.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ExpensesCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) => Dismissible(
                key: ValueKey(cubit.expenses[index]),
                onDismissed: (direction) {
                  cubit.removeExp(cubit.expenses[index]['id']);
                },
                child: ExpenseItem(expense: cubit.expenses[index])),
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 10,
            ),
            itemCount: cubit.expenses.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
          ),
        );
      },

    );
  }
}
