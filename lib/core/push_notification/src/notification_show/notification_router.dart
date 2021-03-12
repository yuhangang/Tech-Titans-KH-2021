import 'package:flutter/material.dart';
import 'package:tech_titans/screens/account/account_page.dart';
import 'package:tech_titans/screens/login/login_page.dart';

class NotificationNavigationHelper {
  Future<void> navigateFromSelect(String routeName, BuildContext context,
      {String? payload}) async {
    if (payload == null) {
      switch (routeName) {
        case AccountPage.route:
          await _handleHomePage(context);
          break;
        default:
          throw 'route not implemented';
          break;
      }
    }
  }

  static _handleHomePage(BuildContext context) {
    Navigator.pushNamed(context, AccountPage.route);
  }
}
