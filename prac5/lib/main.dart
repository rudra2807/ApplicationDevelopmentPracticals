import 'package:currency_picker/currency_picker.dart' as cp;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_converter/Currency.dart' as curr;
import 'package:money_converter/money_converter.dart' as mc;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currencyCode1 = 'Select Currency';
  String _currencyCode2 = 'Select Currency';

  late double convert;

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency Converter')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(_currencyCode1 + ': '),
                    onTap: () {
                      cp.showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (cp.Currency currency) {
                          setState(() {
                            _currencyCode1 = currency.code;
                          });
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) async {
                        convert = (await mc.MoneyConverter.convert(
                            curr.Currency(_currencyCode1,
                                amount: double.parse(value)),
                            curr.Currency(_currencyCode2)))!;

                        setState(() {
                          textEditingController.text = convert.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('To'),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(_currencyCode2 + ': '),
                    onTap: () {
                      cp.showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (cp.Currency currency) {
                          setState(() {
                            _currencyCode2 = currency.code;
                          });
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      enabled: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
