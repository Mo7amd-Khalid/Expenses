import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/modules/expense/cubit/cubit.dart';
import 'package:my_expenses/modules/expense/cubit/state.dart';
import '../../models/expense_model.dart';
import '../../shared/component/component.dart';

class NewExpense extends StatelessWidget {
  const NewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var titleController = TextEditingController();
        var formKey = GlobalKey<FormState>();
        var amountController = TextEditingController();
        var selectedCategory = Category.other;
        DateTime? selectedDate;

        var cubit = ExpensesCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                myTextFormField(
                  maxLength: 50,
                  controller: titleController,
                  keyboard: TextInputType.text,
                  label: const Text('Title'),
                  prefixIcon: const Icon(Icons.title_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: myTextFormField(
                          controller: amountController,
                          keyboard: TextInputType.number,
                          label: const Text('Amount'),
                          prefixIcon: const Icon(Icons.currency_exchange),
                          prefixText: "\$"),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(selectedDate == null
                              ? "No selected date"
                              : DateFormat('MMM dd,yyyy')
                                  .format(selectedDate!)),
                          IconButton(
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2050-12-31'));
                                selectedDate = pickedDate;
                              },
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.blueAccent,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  isExpanded: true,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                            child: Text(e.name.toUpperCase()),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    selectedCategory = value!;
                  },
                  value: selectedCategory,
                ),
                ElevatedButton(
                    onPressed: () {
                      final double? amount =
                          double.tryParse(amountController.text);
                      bool amountValid = amount != null && amount > 0;

                      if (titleController.text.trim().isNotEmpty &&
                          amountValid &&
                          selectedDate != null) {
                        cubit.addExp(Expense(
                            title: titleController.text,
                            amount: amount,
                            category: selectedCategory,
                            date: selectedDate!));
                        Navigator.pop(context);
                      } else {
                        showMyDialog(
                            context: context,
                            content: const Text(
                                "Please check the title, amount and date again"),
                            title: const Text("Invalid Inputs"),
                            dialogRadius: 20,
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK")),
                            ]);
                      }
                    },
                    child: Text('Add new expense'))
              ],
            ),
          ),
        );
      },
    );
  }
}
