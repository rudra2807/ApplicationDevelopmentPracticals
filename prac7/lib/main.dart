import 'package:flutter/material.dart';
import 'package:prac6/GridView.dart';
import 'package:prac6/TabView.dart';
import 'package:prac6/WebView.dart';

import 'StackView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List views = [
    'GridView | ScrollView | CardView',
    'TabView | FragmentView',
    'Stack',
    'WebView'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Views'),
      ),
      bottomNavigationBar: const ListTile(
        tileColor: Colors.blue,
        title: Text(
          'ListView',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: views.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  switch (index + 1) {
                    case 1:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyGridView(),
                            ));
                        break;
                      }
                    case 2:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyTabView(),
                            ));
                        break;
                      }
                    case 3:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StackView(),
                            ));
                        break;
                      }
                    case 4:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyWebView(),
                            ));
                        break;
                      }
                  }
                },
                child: Text(views[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
