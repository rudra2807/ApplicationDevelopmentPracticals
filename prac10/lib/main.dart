import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _countryController = TextEditingController();

    addCountry() {
      print('added');
      FirebaseFirestore.instance
          .collection('countries')
          .doc(_countryController.value.text)
          .set({'name': _countryController.value.text});
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: _countryController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addCountry();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('countries')
                  .snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading");
                } else {
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((document) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          title: Text(
                            document['name'],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  print(document['name']);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController _controller =
                                            TextEditingController();
                                        return Dialog(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextField(
                                                  controller: _controller,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection('countries')
                                                        .doc(document['name'])
                                                        .update({
                                                      'name':
                                                          _controller.value.text
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Update'),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  print(document['name']);
                                  FirebaseFirestore.instance
                                      .collection('countries')
                                      .doc(document['name'])
                                      .delete();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
