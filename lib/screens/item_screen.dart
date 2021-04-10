import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/constants.dart';
import 'package:sigma_store/models/Item.dart';
import 'package:sigma_store/providers/cart_items.dart';
import 'package:vibration/vibration.dart';

import 'cart_screen.dart';

class ItemScreen extends StatelessWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height);
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sigma Store',
            style: headerText,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                })
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: itemHeaderText,
              ),
            ),
            Center(
              child: Hero(
                tag: item.id,
                child: Image.asset(
                  item.image,
                  height: height*.3,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: height * .5,
              child: Consumer<CartItems>(
                builder: (context, value, child) => Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, blurRadius: 10, offset: Offset(1, 1))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Description:',
                        style: detailHeaderText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.description,
                        style: detailText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Retail Price: \$${item.price}',
                        style: priceText,
                      ),
                      Spacer(),
                      Center(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.expand(width: 250, height: 50),
                          child: ElevatedButton(
                            onPressed: () {
                              Vibration.vibrate(duration: 100);
                              value.addToCart(item);
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      Navigator.of(context).pop();
                                    });
                                    return CupertinoAlertDialog(
                                      title: Text('Item Added'),
                                    );
                                  });
                            },
                            child: Text('ADD TO CART'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kgreen),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40)))),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
