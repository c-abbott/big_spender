import 'package:flutter/material.dart';
import 'package:big_spender/model/expense.dart';
import 'package:big_spender/widgets/expenses_list/expenses_list.dart';

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

  void _addExpense() {
    // TODO: Add your code to navigate to add expense screen or open a dialog here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Expenses',
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
      floatingActionButton: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 255, 175),
              Color.fromARGB(255, 32, 223, 255)
            ], // replace with your colors
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: _addExpense,
              backgroundColor: Colors.black87,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
