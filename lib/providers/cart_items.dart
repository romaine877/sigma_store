import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/Item.dart';

final url = Uri.parse(
    'https://sigma-store-1c419-default-rtdb.firebaseio.com/cart.json');

class CartItems with ChangeNotifier {
  List<Item> _cartItems = [];

  List<Item> get items {
    return [..._cartItems];
  }

  Future<void> addToCart(Item item) async {
    if (_cartItems.contains(item)) {
      _cartItems.remove(item);
      item.incrementAmount();
      final updateUrl = Uri.parse(
          'https://sigma-store-1c419-default-rtdb.firebaseio.com/cart/${item.serverID}.json');
      return http
          .patch(updateUrl,
              body: json.encode({
                'amount': item.amount,
              }))
          .then((value) {
        print(value.statusCode);
        _cartItems.add(item);
        notifyListeners();
        print('Item added');
        print(item.amount);
      });
    } else {
      if (item.amount > 1) {
        item.removeAmount();
      }
      item.incrementAmount();
      return http
          .post(url,
              body: json.encode({
                'serverID': item.serverID,
                'name': item.name,
                'description': item.description,
                'price': item.price,
                'isFavorite': item.isfavorite,
                'image': item.image,
                'amount': item.amount,
              }))
          .then((value) {
        print(value.statusCode);
        //item.addServerID(json.decode(value.body)['name']);
        _cartItems.add(item);
        notifyListeners();
        print('Item added');
        print(item.amount);
      });
    }
  }

  void removeFromCart(Item item) {
    final deleteUrl = Uri.parse(
        'https://sigma-store-1c419-default-rtdb.firebaseio.com/cart/${item.serverID}.json');
    http.delete(deleteUrl);
    item.removeAmount();
    _cartItems.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _cartItems.forEach((element) {
      element.removeAmount();
    });
    _cartItems.removeWhere((element) =>true);
    _cartItems.clear();
    final deleteUrl = Uri.parse(
        'https://sigma-store-1c419-default-rtdb.firebaseio.com/cart.json');
    http.delete(deleteUrl);
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
