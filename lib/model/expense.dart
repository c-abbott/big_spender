import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work, other }

const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight_rounded,
  Category.leisure: Icons.golf_course_rounded,
  Category.work: Icons.work_rounded,
  Category.other: Icons.category_rounded
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.expenseCreatedAt,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime expenseCreatedAt;
  final Category category;

  String get formattedDate {
    return formatter.format(expenseCreatedAt);
  }
}
