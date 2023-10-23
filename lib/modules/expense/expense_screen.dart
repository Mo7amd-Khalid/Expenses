import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/modules/chart/chart.dart';
import 'package:my_expenses/modules/expense/cubit/cubit.dart';
import 'package:my_expenses/modules/expense/cubit/state.dart';
import 'package:my_expenses/modules/expense_list/expense_list.dart';
import 'package:my_expenses/modules/new_expense/new_expense.dart';
import '../../shared/component/icon_broken.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            elevation: 2,
            title: const Text(" My Expenses"),
            toolbarHeight: 60,
            actions: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.showBottomSheet(
                          (context) => NewExpense(),
                      backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)));
                },
                icon: const Icon(
                  IconBroken.Plus,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
            centerTitle: true,
          ),
          body: const Column(
            children: [
              Chart(),
              ExpensesList(),
            ],
          ),
        );
      },
    );
  }

}

