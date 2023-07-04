import 'package:dice/widgets/new_expense.dart';
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

  void _onAddExpense(Expense expense){
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text("Expense deleted"),
          action: SnackBarAction(
              label: "Undo",
              onPressed: (){
                setState(() {
                  _expenses.insert(expenseIndex, expense);
                });
              }
          ),

        )
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, 
        builder: (ctx) => NewExpense(onAddExpense: _onAddExpense,)
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(child: Text("No expenses"),);

    if(_expenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _expenses, onRemoveExpense: _removeExpense,);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Expenses"),
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: mainContent)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
