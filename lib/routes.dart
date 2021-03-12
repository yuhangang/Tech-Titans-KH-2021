import 'package:flutter/material.dart';
import 'package:tech_titans/main.dart';
import 'package:tech_titans/screens/account/account_page.dart';
import 'package:tech_titans/screens/home_page/home_page.dart';
import 'package:tech_titans/screens/login/login_page.dart';

abstract class PageRoutes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AccountPage.route: (ctx) => AccountPage(),
    MyHomePage.route: (ctx) => MyHomePage(),
    LoginPage.route: (ctx) => LoginPage()
  };
}
