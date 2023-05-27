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

  Widget _numButton(String? value, {void Function()? onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap ??
          () {
            _append(value!);
          },
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 255, 175),
              Color.fromARGB(255, 32, 223, 255)
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Container(
            height: 70, // size of the button
            width: 112, // size of the button
            decoration: BoxDecoration(
              color: Colors.black87, // fill color
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: icon == null
                ? Text(
                    value!,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  )
                : Icon(icon, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: const Alignment(0, -0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "ISK", // The hardcoded currency
                style: TextStyle(fontSize: 24, fontFamily: 'ProximaNova'),
              ),
              const SizedBox(
                width:
                    10, // You can adjust the space between the currency and the number as needed
              ),
              Text(
                _output,
                style: const TextStyle(fontSize: 64, fontFamily: 'ProximaNova'),
              ),
            ],
          ),
        ),
        if (_output != "0")
          Align(
            alignment: const Alignment(1, -0.83),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              width: 40, // change as needed
              height: 40, // change as needed
              child: GestureDetector(
                onTap: _delete,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.backspace,
                        size: 36), // adjust icon size as necessary
                  ),
                ),
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.55,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              children: <Widget>[
                for (var i = 1; i < 10; i++) _numButton(i.toString()),
                _numButton("."),
                _numButton("0"),
                _numButton(null, onTap: () {}, icon: Icons.check),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
