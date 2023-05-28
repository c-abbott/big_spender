import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context)
          .size
          .height, // set height to full screen height
      child: const Padding(
        padding: EdgeInsets.only(top: 48),
        child: Column(
          children: [
            Text('Blah'),
          ],
        ),
      ),
    );
  }
}
