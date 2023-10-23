import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


enum Category {sport, food, funny, work, other}

const expenseIcons = {
  'food': Icons.food_bank_outlined,
  'work': Icons.work,
  'sport': Icons.sports,
  'other': Icons.more_horiz,
  'funny': Icons.movie_creation_outlined,
};

class Expense {
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String get expenseDate {
    return DateFormat('MMM dd,yyyy').format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}

class ExpenseBucket {
  final String category;
  final List<Map>  expenses;

  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.fromCategory(
      {required this.category, required List<Map>  expenses})
      : expenses =
            expenses.where((element) => element['category'] == category).toList();


  get allAmount {
    double sum = 0;

    for(var element in expenses) {
      sum += element['amount'];
    }

    return sum;
  }


}
