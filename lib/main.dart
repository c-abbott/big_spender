import 'package:flutter/material.dart';
import 'package:big_spender/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
