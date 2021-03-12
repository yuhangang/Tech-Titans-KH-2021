import 'package:flutter/cupertino.dart';

class SummaryProvider extends ChangeNotifier {
  double _footPrintCurrentMonth = 20;
  double get footPrintCurrentMonth => _footPrintCurrentMonth;
  void setfootPrintCurrentMonth(double footPrint) {
    _footPrintCurrentMonth = footPrint;
    notifyListeners();
  }

  String getUnitName() => getName(_footPrintCurrentMonth);
  String getUnitNumString() => getString(_footPrintCurrentMonth);
}

String getName(double count) {
  return count > 100 ? "ton" : "kg";
}

String getString(double count) {
  if (count > 100000) {
    return (count / 1000).toStringAsFixed(0);
  }
  if (count > 10000) {
    return (count / 1000).toStringAsFixed(1);
  }
  if (count > 100) {
    return (count / 1000).toStringAsFixed(2);
  }

  return count.toStringAsFixed(2);
}
