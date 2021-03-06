import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/providers/cart_items.dart';

import '../constants.dart';
import 'item_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            sagicorBlue,
            sagicorDark,
          ],
        ),
      ),
      child: Consumer<CartItems>(
        builder: (context, value, child) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ElevatedButton(
            onPressed: () {
              value.removeAll();
            },
            child: Text('Cash Out'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(sagicorBlue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text(
              'Cart',
              style: TextStyle(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: sagicorGreen,
                    ),
                    child: Center(
                        child: Text(
                      '\$${value.totalPrice.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: value.itemCount,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) {
                value.removeFromCart(value.items[index]);
              },
              key: Key(value.items[index].serverID),
              child: Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ItemScreen(item: value.items[index]))),
                  leading: Hero(
                      tag: value.items[index].serverID,
                      child: Image.network(value.items[index].image)),
                  title: Text(value.items[index].name),
                  subtitle:
                      Text('Quantity: ' + value.items[index].amount.toString()),
                  trailing: Text('\$${value.items[index].price}'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
