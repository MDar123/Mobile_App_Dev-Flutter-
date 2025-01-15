import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];
  double _checkoutTotal = 0.0;

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  double get checkoutTotal => _checkoutTotal;

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    _updateTotal(); // Automatically update total when an item is added
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _cartItems.remove(item);
    _updateTotal(); // Automatically update total when an item is removed
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _checkoutTotal = 0.0; // Reset total when the cart is cleared
    notifyListeners();
  }

  void updateCheckoutTotal(double total) {
    _checkoutTotal = total;
    notifyListeners();
  }

  void _updateTotal() {
    _checkoutTotal = _cartItems.fold(0.0, (sum, item) {
      double price = double.parse(item['price'].toString());
      int quantity =
          item['quantity'] ?? 1; // Default quantity to 1 if not provided
      return sum + (price * quantity);
    });
  }
}
