import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
