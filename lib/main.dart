import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/modules/expense/cubit/cubit.dart';
import 'package:my_expenses/shared/bloc_observer.dart';
import 'package:my_expenses/shared/style/themes.dart';

import 'modules/expense/cubit/state.dart';
import 'modules/expense/expense_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExpensesCubit()..createDataBase(),
      child: BlocConsumer<ExpensesCubit, ExpensesAppStates> (
        listener: (context, state) => {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: ExpenseScreen(),
        ),
      )
    );
  }
}
