import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/modules/chart/chart_bar.dart';
import 'package:my_expenses/modules/expense/cubit/cubit.dart';
import 'package:my_expenses/modules/expense/cubit/state.dart';

import '../../models/expense_model.dart';

class Chart extends StatelessWidget {
  const Chart({super.key,});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ExpensesCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for(final ele in cubit.bucket) ChartBarItem(fill: ele.allAmount == 0? 0 : ele.allAmount / cubit.maxAmount)
                    ]
                ),
              ),
              Row(
                  children: cubit.bucket.map((e) => Expanded(child: Icon(expenseIcons[e.category],))).toList()
              ),
              Row(
                  children: cubit.bucket.map((e) => Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(e.category),
                  ))).toList()
              ),
            ],
          ),
        );
      },

    );
  }
}
