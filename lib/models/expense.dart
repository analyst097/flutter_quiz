
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

enum Category{
  food,
  travel,
  work,
  leisure,
  dues,
  emi,
  learning,
  misc
}

class Expense{
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