import 'package:flutter/material.dart';
import 'package:flutter_buttons/core/store.dart';
import 'package:flutter_buttons/pages/cart_page.dart';
import 'package:flutter_buttons/pages/home_detail.dart';
import 'package:flutter_buttons/pages/home_page.dart';
import 'package:flutter_buttons/pages/login_Page.dart';
import 'package:flutter_buttons/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/detail": (context) => HomeDetailPage(catalog: null),
        "/cart": (context) => CartPage(),
      },
    );
  }
}
