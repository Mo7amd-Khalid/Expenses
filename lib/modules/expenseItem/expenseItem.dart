import 'package:flutter/material.dart';

import '../../models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Map expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              expense['title'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  "\$${expense['amount'].toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Icon(expenseIcons[expense['category']],),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  expense['date'],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
