import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses, super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
      itemCount: expenses.length,

    );
  }
}
