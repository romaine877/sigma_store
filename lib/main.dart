import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/item_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.green),
      home: ItemScreen(),
    );
  }
}
