import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int chosenDate = 0, chosenMonth = 0, chosenYear = 0;
  String year = '', month = '', days = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickBdate();
              },
              child: Text('Pick a Date'),
            ),
            Text(year + ' ' + month + ' ' + days + ' '),
          ],
        ),
      ),
    );
  }

  Future pickBdate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    chosenDate = int.parse(DateFormat("dd").format(date));
    chosenMonth = int.parse(DateFormat("MM").format(date));
    chosenYear = int.parse(DateFormat("yyyy").format(date));

    int currDate = int.parse(DateFormat("dd").format(DateTime.now()));
    int currMonth = int.parse(DateFormat("MM").format(DateTime.now()));
    int currYear = int.parse(DateFormat("yyyy").format(DateTime.now()));

    int numberOfDays = findDays(currMonth, currYear);

    setState(() {
      if (currDate - chosenDate >= 0) {
        days = (currDate - chosenDate).toString() + " days";
      } else {
        days = (currDate + numberOfDays - chosenDate).toString() + " days";
        currMonth--;
      }

      if (currMonth - chosenMonth >= 0) {
        month = (currMonth - chosenMonth).toString() + " months";
      } else {
        month = (currMonth + 12 - chosenMonth).toString() + " months";
        currYear--;
      }

      year = (currYear - chosenYear).toString() + " years";
    });
  }

  int findDays(int currMonth, int currYear) {
    if (currMonth == 1 ||
        currMonth == 3 ||
        currMonth == 5 ||
        currMonth == 7 ||
        currMonth == 8 ||
        currMonth == 10 ||
        currMonth == 12) {
      return 31;
    } else if (currMonth == 4 ||
        currMonth == 6 ||
        currMonth == 9 ||
        currMonth == 11) {
      return 30;
    } else {
      if (checkYear(currYear)) {
        return 29;
      } else {
        return 28;
      }
    }
  }

  bool checkYear(int year) {
    if (year % 400 == 0) return true;

    if (year % 100 == 0) return false;

    if (year % 4 == 0) return true;
    return false;
  }
}
