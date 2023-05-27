import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumPad extends StatefulWidget {
  const NumPad({Key? key}) : super(key: key);

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  DateTime selectedDate = DateTime.now();
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );
    if (picked != null && picked != TimeOfDay.fromDateTime(selectedDate)) {
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month,
            selectedDate.day, picked.hour, picked.minute);
      });
    }
  }

  Widget _dateButton() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Text(
        DateFormat.yMd().format(selectedDate),
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'ProximaNova',
        ),
      ),
    );
  }

  Widget _timeButton() {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Text(
        DateFormat.Hm().format(selectedDate),
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'ProximaNova',
        ),
      ),
    );
  }

  Widget _dateTimePickerButton() {
    return Column(
      children: <Widget>[
        _dateButton(),
        _timeButton(),
      ],
    );
  }

  Widget _numButton(String? value, {void Function()? onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap ?? () => _append(value!),
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
          child: icon == null
              ? Text(
                  value!,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'ProximaNova'),
                )
              : Icon(icon, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: _dateTimePickerButton(),
        ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
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
                  style: const TextStyle(
                      fontSize: 64,
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.w600),
                ),
                if (_output != "0")
                  Container(
                    alignment: Alignment.centerRight,
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
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            children: <Widget>[
              for (var i = 1; i < 10; i++) _numButton(i.toString()),
              _numButton("."),
              _numButton("0"),
              _numButton(null, icon: Icons.check),
            ],
          ),
        ),
      ],
    );
  }
}
