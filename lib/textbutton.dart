import 'package:flutter/material.dart';

// ignore: camel_case_types
class textbuttonWidget extends StatelessWidget {
  const textbuttonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        debugPrint('Pressed');
      },
      style: const ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(222, 3, 13, 80)),
          foregroundColor:
              WidgetStatePropertyAll(Color.fromARGB(222, 63, 76, 160)),
          fixedSize: WidgetStatePropertyAll(
            Size(200, 50),
          )),
      child: const Text(
        'Convert',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
