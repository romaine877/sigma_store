import 'package:flutter/material.dart';
import 'package:sigma_store/models/itemList.dart';
import '../models/Item.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sigma Store',
                style: headerText,
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
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
                                              child: Card(
                          //margin: EdgeInsets.only(left: 20, ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 20, right: 10),
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
                                child: Image.asset(
                                  itemList[index].image,
                                  height: 100,
                                  fit: BoxFit.fill,
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
                    }),
              )
            ],
          )),
    );
  }
}
