import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(expense.title, style: const TextStyle(fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 8,),

                Row(
                  children: [
                    Text(
                        expense.formattedDate,
                        style: const TextStyle(color: Colors.blueGrey)),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        expense.category.toString().split(".")[1],
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        expense.tags.join(' '),
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              "Rs.${expense.amount}",
              style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
