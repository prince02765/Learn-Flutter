import 'package:flutter/material.dart';
import 'package:futter_learn/Pages/home_page.dart';
import 'package:futter_learn/core/store.dart';
import 'package:futter_learn/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/cart_page.dart';
import 'Pages/login_page.dart';
import 'Widgets/themes.dart';

void main() {
  runApp(VxState(
    store : MyStore(),
    child: ThisApp()
  ));
}

class ThisApp extends StatelessWidget {
  const ThisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme(context),
      initialRoute: Routes.HomeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        Routes.HomeRoute: (context) => const HomePage(),
        Routes.HomeRoute: (context) => const HomePage(),
        Routes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
