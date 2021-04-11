import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_1.png?alt=media&token=bbc475ba-fa16-47e2-b64c-78189d84e532',
    ),
    Item(
      id: '002',
      name: 'Green Infusion Water Bottle',
      description:
          'Run infused with your own naturally flavoured fruit or herb water.',
      price: 1550,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_2.png?alt=media&token=65aa655d-a7d2-425a-898d-abe3bc46e816',
    ),
    Item(
      id: '003',
      name: 'Lime Green Run Shirt',
      description:
          'Run like a champion with this sporty fitted moisture-wicking lime green top with black piping.',
      price: 2000,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_3.png?alt=media&token=66cd0676-067e-4999-816f-7adfaab2fbd1',
    ),
    Item(
      id: '004',
      name: 'Participant Race Day Shirt',
      description:
          'Run with the essentials, our official 2018 Sigma Run Race-Day T.Dri-fit with, sublimated, sporty print. ',
      price: 1450,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_4.png?alt=media&token=417276d9-28b9-496c-adf2-425ab4bc28a9',
    ),
    Item(
      id: '005',
      name: 'Sigma Branded Flip Flop Slippers',
      description:
          'Run on the beach with our one-of-a-kind Sigma Run print flip-flops.',
      price: 2450,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_5.png?alt=media&token=535a1311-34dc-4c82-8a06-85ec1a8794f4',
    ),
    Item(
      id: '006',
      name: 'Sigma Branded Running Shoes',
      description:
          'Run with this tote bag for a cause. Keep one in the car or tucked in your purse.',
      price: 500,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bag_6.png?alt=media&token=997d441d-7297-4215-87ad-0ec7a72ac80e',
    ),
    Item(
      id: '007',
      name: 'Lime Green Big Top Tumble',
      description: 'Run hydrated with our biggest tumbler ',
      price: 1600,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/bottle1.jpg?alt=media&token=b9799589-39a2-4bfa-b857-95e1aae264e3',
    ),
    Item(
      id: '008',
      name: 'Orange Red Small Top Tumble',
      description: 'Run hydrated with our smallest tumbler ',
      price: 1600,
      image:
          'https://firebasestorage.googleapis.com/v0/b/sigma-store-1c419.appspot.com/o/shirt1.jpg?alt=media&token=052fb574-c9ce-40b3-99a3-01de14f691a8',
    ),
  ];

  List<Item> itemList = [];

  Future<void> fetchItems() async {
    final url = Uri.parse(
        'https://sigma-store-1c419-default-rtdb.firebaseio.com/items.json');
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
    });
    itemList = loadedItems;
    notifyListeners();
  }
}
