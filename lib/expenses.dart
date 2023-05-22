import 'package:flutter/material.dart';
import 'package:big_spender/model/expense.dart';
import 'package:big_spender/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Groceries',
        amount: 20.0,
        expenseCreatedAt: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Cinema',
        amount: 14.30,
        expenseCreatedAt: DateTime.now(),
        category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
