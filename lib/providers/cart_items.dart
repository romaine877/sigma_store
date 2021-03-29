import 'package:flutter/foundation.dart';

import '../models/Item.dart';

class CartItems with ChangeNotifier {
  List<Item> _cartItems = [];

  List<Item> get items {
    return [..._cartItems];
  }

  void addToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
    print('Item added');
  }

  void removeFromCart(Item item) {
    _cartItems.remove(item);
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
