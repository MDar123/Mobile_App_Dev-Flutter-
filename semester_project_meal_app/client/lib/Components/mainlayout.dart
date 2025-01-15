import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_project/Components/header.dart';
import 'package:semester_project/providers/cart_provider.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItemCount = Provider.of<CartProvider>(context).cartItemCount;

    return Scaffold(
      appBar: Header(cartItemCount: cartItemCount),
      body: child,
    );
  }
}
