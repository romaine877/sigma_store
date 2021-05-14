import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sigma_store/keys.dart';

import 'Item.dart';

class ItemList extends ChangeNotifier {
  List<Item> dummyList = [
    Item(
      id: '001',
      name: 'Double Hot & Cold Tumbler',
      description:
          'Run hot when you’re cold and cold you’re not with this double duty tumbler.',
      price: 1450,
      image:
          bag1,
    ),
    Item(
      id: '002',
      name: 'Green Infusion Water Bottle',
      description:
          'Run infused with your own naturally flavoured fruit or herb water.',
      price: 1550,
      image:
          bag2,
    ),
    Item(
      id: '003',
      name: 'Lime Green Run Shirt',
      description:
          'Run like a champion with this sporty fitted moisture-wicking lime green top with black piping.',
      price: 2000,
      image:
          bag3,
    ),
    Item(
      id: '004',
      name: 'Participant Race Day Shirt',
      description:
          'Run with the essentials, our official 2018 Sigma Run Race-Day T.Dri-fit with, sublimated, sporty print. ',
      price: 1450,
      image:
          bag4,
    ),
    Item(
      id: '005',
      name: 'Sigma Branded Flip Flop Slippers',
      description:
          'Run on the beach with our one-of-a-kind Sigma Run print flip-flops.',
      price: 2450,
      image:
          bag5,
    ),
    Item(
      id: '006',
      name: 'Sigma Branded Running Shoes',
      description:
          'Run with this tote bag for a cause. Keep one in the car or tucked in your purse.',
      price: 500,
      image:
          bag6,
    ),
    Item(
      id: '007',
      name: 'Lime Green Big Top Tumble',
      description: 'Run hydrated with our biggest tumbler ',
      price: 1600,
      image:
          bag7,
    ),
    Item(
      id: '008',
      name: 'Orange Red Small Top Tumble',
      description: 'Run hydrated with our smallest tumbler ',
      price: 1600,
      image:
          bag8,
    ),
  ];

  List<Item> itemList = [];

  Future<void> fetchItems() async {
    final url = Uri.parse(
        apiKey);
    http.Response response = await http.get(url);
    final List<Item> loadedItems = [];
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      loadedItems.add(Item(
          serverID: key,
          name: value['name'],
          price: value['price'],
          description: value['description'],
          image: value['image'],
          isfavorite: value['isFavorite']));
      print(key);
    });
    itemList = loadedItems;
    notifyListeners();
  }
}
