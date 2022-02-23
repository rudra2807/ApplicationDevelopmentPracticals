import 'package:flutter/material.dart';

class ItemOne extends StatelessWidget {
  const ItemOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Item One'),
        ),
      ),
    );
  }
}
