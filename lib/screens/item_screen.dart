import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/constants.dart';
import 'package:sigma_store/models/Item.dart';
import 'package:sigma_store/providers/cart_items.dart';

class ItemScreen extends StatelessWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.cyan,
          elevation: 0,
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
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
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
                              value.addToCart(item);
                            },
                            child: Text('ADD TO CART'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kgreen),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)))),
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
