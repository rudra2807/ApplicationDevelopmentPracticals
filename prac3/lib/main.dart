import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 40.0, left: 40.0),
                child: TextField(
                  controller: field1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                child: TextFormField(
                  controller: field2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: validate,
                child: Text('Calculate'),
              )
            ],
          ),
        ),
      ),
    );
  }

  validate() {
    int num1 = 0, num2 = 0;

    if (!isNumeric(field1.value.text) || !isNumeric(field2.value.text)) {
      Fluttertoast.showToast(msg: 'Invalid Input');
    } else {
      num1 = int.parse(field1.value.text);
      num2 = int.parse(field2.value.text);
      int sum = num1 + num2;
      Fluttertoast.showToast(msg: 'Sum: $sum');
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
