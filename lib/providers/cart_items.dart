import 'package:flutter/foundation.dart';

import '../models/Item.dart';

class CartItems with ChangeNotifier {
  List<Item> _cartItems = [];

  List<Item> get items {
    return [..._cartItems];
  }

  void addToCart(Item item) {
    if (_cartItems.contains(item)) {
      _cartItems.remove(item);
      item.increaseAmount();
      _cartItems.add(item);
      notifyListeners();
      print('Item added');
      print(item.amount);
    } else {
      _cartItems.add(item);
      notifyListeners();
      print('Item added');
      print(item.amount);
    }
  }

  void removeFromCart(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _cartItems = [];
    notifyListeners();
  }

  int get itemCount {
    return _cartItems.length;
  }

  double get totalPrice {
    double total = 0;
    _cartItems.forEach((element) {
      total += element.price * element.amount;
    });
    return total;
  }
}
