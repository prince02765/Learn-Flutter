import 'package:flutter/material.dart';
import 'package:futter_learn/Pages/home_page.dart';
import 'package:futter_learn/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(const ThisApp());
}

class ThisApp extends StatelessWidget {
  const ThisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: Routes.HomeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        Routes.HomeRoute: (context) => const HomePage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
