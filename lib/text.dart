import 'package:flutter/material.dart';

// ignore: camel_case_types
class textWidget extends StatelessWidget {
  const textWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("Currency Converter",
        style: TextStyle(
            color: Color.fromARGB(205, 239, 235, 235),
            fontSize: 30,
            fontWeight: FontWeight.bold));
  }
}
