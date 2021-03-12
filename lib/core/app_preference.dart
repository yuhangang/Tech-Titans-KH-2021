import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_titans/providers/auth_provider.dart';

class AppPreference extends ChangeNotifier {
  static const String _authentication = 'authentication';

  static Future<User?> fetchUserSetting() async {
    var prefs = await SharedPreferences.getInstance();
    try {
      return User.fromJson(jsonDecode(prefs.getString('authentication') ?? ""));
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveUserData(User userData) async {
    var prefs = await SharedPreferences.getInstance();
    print(userData.toJson());
    await prefs.setString(_authentication, jsonEncode(userData.toJson()));
  }

  static Future<void> removeUserData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authentication, "");
  }
}
