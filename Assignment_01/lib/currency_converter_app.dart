import 'package:first_project/text.dart';
import 'package:first_project/textbutton.dart';
import 'package:first_project/textfield.dart';
import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(205, 95, 70, 217),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: textfieldWidget(),
            ),
            textbuttonWidget(),
          ],
        )),
      ),
    );
  }
}
