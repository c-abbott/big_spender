import 'package:flutter/material.dart';

class NumPad extends StatefulWidget {
  const NumPad({Key? key}) : super(key: key);

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  String _output = "0";

  void _append(String val) {
    setState(() {
      if (_output == "0" && val != ".") {
        _output = val;
      } else {
        _output = _output + val;
      }
    });
  }

  void _delete() {
    setState(() {
      if (_output.length > 1) {
        _output = _output.substring(0, _output.length - 1);
      } else {
        _output = "0";
      }
    });
  }

  Widget _numButton(String value) {
    return GestureDetector(
      onTap: () {
        _append(value);
      },
      child: Container(
        margin: const EdgeInsets.all(4.0), // Space between buttons
        width: 80, // Set the width
        height: 40, // Set the height
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // Specify the border color
            width: 2.0, // Specify the border thickness
          ),
          borderRadius: BorderRadius.circular(32), // Border radius
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(fontSize: 24), // adjust font size as necessary
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _output,
          style: const TextStyle(fontSize: 48),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              for (var i = 1; i < 10; i++) _numButton(i.toString()),
              _numButton("."),
              _numButton("0"),
              GestureDetector(
                onTap: _delete,
                child: Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.backspace),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
