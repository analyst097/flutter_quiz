
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  work,
  leisure,
  dues,
  emi,
  learning,
  misc
}

class Expense {
  Expense({
    required this.title,
    this.description = "",
    required this.amount,
    required this.category,
    required this.tags,
    required this.dateTime}) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime dateTime;
  final Category category;
  final List<String> tags;

  String get formattedDate {
    return dateFormatter.format(dateTime);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) :
      expenses = allExpenses.where((el) => el.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for(final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}