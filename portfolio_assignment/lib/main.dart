import 'package:flutter/material.dart';
import 'package:portfolio_assignment/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      home: MainScreen(),
    );
  }
}
