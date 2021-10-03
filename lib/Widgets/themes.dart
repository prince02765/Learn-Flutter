import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes{
  static ThemeData lightTheme (BuildContext context) => ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.montserrat().fontFamily,

    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20, 
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontWeight: FontWeight.bold
        ),
    )
  );

  static ThemeData darkTheme (BuildContext context) => ThemeData(
    brightness: Brightness.dark
  );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}