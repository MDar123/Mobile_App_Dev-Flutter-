import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 8, 8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Currency Converter App',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(98, 8, 8, 8),
                    fontStyle: FontStyle.italic),
              ),
            ),
            const TextField(
              keyboardType: TextInputType.text,
              selectionHeightStyle: BoxHeightStyle.max,
            ),
            TextButton(
              onPressed: () {
                debugPrint('Pressed');
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
