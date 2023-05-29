import 'package:flutter/material.dart';
import 'package:big_spender/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '${expense.amount.toStringAsFixed(0)}ISK',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(expense.formattedDate,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
