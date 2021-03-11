import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_titans/core/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeData get appTheme =>
      ThemeBuilder.buildThemeData(themeColorIndex: 0, isDarkMode: _isDarkTheme);

  void setDarkMode(bool _) {
    _isDarkTheme = _;
    notifyListeners();
  }
}
