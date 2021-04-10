import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kgrey = Color(0xff9dd7ee);

Color sagicorGreen = Color(0xff84bd00);
Color sagicorBlue = Color(0xff00a9e0);
Color sagicorDark = Color(0xff003862);
Color kbackground = Color(0xff9dd7ee);
Color kgreen = Color(0xff0dd7df);

Decoration background = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      sagicorBlue,
      sagicorDark,
    ],
  ),
);

class Style {
  static TextStyle h1 =
      GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.w400);
}

TextStyle headerText =
    GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.w400);

TextStyle titleText =
    GoogleFonts.ubuntu(fontSize: 15, fontWeight: FontWeight.w700);

TextStyle itemHeaderText =
    GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w700);

TextStyle detailHeaderText =
    GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w500);

TextStyle detailText = GoogleFonts.ubuntu(
  fontSize: 20,
);

TextStyle priceText =
    GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold);

SnackBar snackbar = SnackBar(
  content: Text('Item Added in Chart'),
  duration: Duration(milliseconds: 500),
);


