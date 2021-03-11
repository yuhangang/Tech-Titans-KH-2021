import 'package:flutter/material.dart';
import 'package:tech_titans/screens/account/account_page.dart';

abstract class PageRoutes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AccountPage.route: (ctx) => AccountPage()
  };
}
