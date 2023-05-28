import 'package:flutter/material.dart';
import 'package:big_spender/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true, fontFamily: 'ProximaNova'),
      home: const Expenses(),
    ),
  );
}
