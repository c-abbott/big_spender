import 'package:flutter/material.dart';
import 'package:big_spender/model/expense.dart';
import 'package:big_spender/widgets/expenses_list/expenses_list.dart';

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
        amount: 8940,
        expenseCreatedAt: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Cinema',
        amount: 4300,
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
