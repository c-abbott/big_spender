import 'package:big_spender/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:big_spender/model/expense.dart';
import 'package:big_spender/widgets/expenses_list/expenses_list.dart';
import 'package:big_spender/widgets/gradient_border_fab.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

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

  void _addExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your expenses',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
      floatingActionButton: GradientBorderFab(onPressed: _addExpenseOverlay),
    );
  }
}
