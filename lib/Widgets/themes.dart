import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
class AppThemes{
  static ThemeData lightTheme (BuildContext context) => ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonColor: darkBluishColor,
    accentColor: darkBluishColor,

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
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonColor: lightBluishColor,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20, 
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontWeight: FontWeight.bold
      ),
    )
  );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
  static Color lightDray = Color(0xffd3d3d3);


}