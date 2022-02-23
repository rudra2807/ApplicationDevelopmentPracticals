import 'package:flutter/material.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView | ScrollView | CardView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          20,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Image.asset('images/vegeta.jpg'),
              ),
            );
          },
        ),
      ),
    );
  }
}
