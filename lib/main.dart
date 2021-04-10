import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/providers/cart_items.dart';
import './screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CartItems>(
      create: (context) => CartItems(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.green),
        home: HomePage());
  }
}
