import 'package:flutter/foundation.dart';
import '../models/flower.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.flower.price * item.quantity);

  void addToCart(Flower flower, [int quantity = 1]) {
    final index = _items.indexWhere((item) => item.flower.id == flower.id);
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(flower: flower, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(String flowerId) {
    _items.removeWhere((item) => item.flower.id == flowerId);
    notifyListeners();
  }

  void updateQuantity(String flowerId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(flowerId);
      return;
    }
    final index = _items.indexWhere((item) => item.flower.id == flowerId);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
