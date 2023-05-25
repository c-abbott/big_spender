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
        margin: const EdgeInsets.all(6.0), // Here
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(fontSize: 24),
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
            childAspectRatio: 3 / 2,
            children: <Widget>[
              for (var i = 1; i < 10; i++) _numButton(i.toString()),
              _numButton("."),
              _numButton("0"),
              Container(
                margin: const EdgeInsets.all(4.0), // And here
                child: GestureDetector(
                  onTap: _delete,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Icon(Icons.backspace),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
