import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  double _amount = 0.0;

  void _updateAmount(double value) {
    setState(() {
      _amount += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // This is a simple TextField for date, you might want to replace it with a proper DatePicker
          TextField(
            decoration: InputDecoration(
              labelText: 'Date',
            ),
          ),
          // You might want to adjust the height to your needs
          Text(
            '$_amount \$',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ), // You might want to adjust the height to your needs
          // A simple grid view with some buttons
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return TextButton(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _updateAmount(index + 1);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
