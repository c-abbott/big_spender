import 'package:flutter/material.dart';

class GradientBorderFab extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientBorderFab({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: Colors.black87,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
