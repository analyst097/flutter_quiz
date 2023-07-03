import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {

  final List<Expense> _expenses = [
    Expense(
        title: 'Flutter Course',
        amount: 499,
        category: Category.learning,
        tags: ["#udemy"],
        dateTime: DateTime.now()
    ),Expense(
        title: 'NodeJs',
        amount: 499,
        category: Category.learning,
        tags: ["#udemy"],
        dateTime: DateTime.now()
    ),Expense(
        title: 'Angular',
        amount: 499,
        category: Category.learning,
        tags: ["#udemy"],
        dateTime: DateTime.now()
    ),Expense(
        title: 'Pizza',
        amount: 750,
        category: Category.food,
        tags: ["#dominos"],
        dateTime: DateTime.now()
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, 
        builder: (ctx) => Text("Modal")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Expenses"),
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpensesList(expenses: _expenses,))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
