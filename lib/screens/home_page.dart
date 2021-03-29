import 'package:flutter/material.dart';
import 'package:sigma_store/models/itemList.dart';
import 'package:sigma_store/screens/cart_screen.dart';
import 'package:sigma_store/screens/item_screen.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        appBar: AppBar(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CartScreen()));
                })
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: itemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .8,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ItemScreen(item: itemList[index]))),
                    child: Card(
                      //margin: EdgeInsets.only(left: 20, ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, right: 10),
                        child: GridTile(
                          header: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${itemList[index].price}',
                                style: titleText,
                              ),
                              IconButton(
                                  icon: Icon(Icons.favorite), onPressed: () {})
                            ],
                          ),
                          child: Center(
                            child: Hero(
                              tag: itemList[index].id,
                              child: Image.asset(
                                itemList[index].image,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          footer: Text(
                            itemList[index].name,
                            style: titleText,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
