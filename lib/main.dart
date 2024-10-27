// ignore: file_names
import 'package:first_project/currency_converter_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const mob());
}

// ignore: camel_case_types
class mob extends StatelessWidget {
  const mob({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterApp(),
    );
  }
}
