import 'package:flutter/material.dart';

class MyTabView extends StatefulWidget {
  const MyTabView({Key? key}) : super(key: key);

  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabView | FragmentView'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
              Tab(
                icon: Icon(Icons.usb),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Icon(Icons.add),
            ),
            Container(
              child: Icon(Icons.settings),
            ),
            Container(
              child: Icon(Icons.usb),
            )
          ],
        ),
      ),
    );
  }
}
