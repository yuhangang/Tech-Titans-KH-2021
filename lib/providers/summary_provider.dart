import 'dart:math';

import 'package:flutter/cupertino.dart';

const monthList = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'June',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class SummaryProvider extends ChangeNotifier {
  List<Record> oldRecord = [];
  double _footPrintCurrentMonth = 20;
  int month = 0;
  double transportSum = 0;
  double electricitySum = 0;
  double foodSum = 0;
  double tPercent = 0;
  double ePercent = 0;
  double fPercent = 0;
  String get monthName => monthList[month];

  double get footPrintCurrentMonth => _footPrintCurrentMonth;
  void setfootPrintCurrentMonth(double footPrint) {
    _footPrintCurrentMonth = footPrint;
    notifyListeners();
  }

  String getUnitName() => getName(_footPrintCurrentMonth);
  String getUnitNumString() => getString(_footPrintCurrentMonth);

  void submitSurvey(
      {required double transportBill, required double electricityBill}) {
    foodSum = 75;
    transportSum = transportBill * 2.3 / 2.5;
    electricitySum = electricityBill * 0.256 / 0.4;
    debugPrint("$transportSum $electricitySum ${oldRecord.length}");
    _footPrintCurrentMonth = foodSum + transportSum + electricitySum;
    tPercent = (transportSum / _footPrintCurrentMonth) * 100;
    ePercent = (electricitySum / _footPrintCurrentMonth) * 100;
    fPercent = (foodSum / _footPrintCurrentMonth) * 100;
    oldRecord.add(new Record(
        footPrintCurrentMonth: footPrintCurrentMonth,
        month: month,
        transportSum: transportSum,
        electricitySum: electricitySum,
        foodSum: foodSum,
        tPercent: tPercent,
        ePercent: ePercent,
        fPercent: fPercent));
    incrementMonth();
    notifyListeners();
  }

  void reset() {
    transportSum = 0;
    electricitySum = 0;
    foodSum = 0;
    tPercent = 0;
    ePercent = 0;
    fPercent = 0;
    _footPrintCurrentMonth = 0;
    month = 0;
    oldRecord = [];
  }

  void incrementMonth() {
    if (month < 11) month += 1;
  }
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

class Record {
  double footPrintCurrentMonth;
  int month;
  double transportSum;
  double electricitySum;
  double foodSum;
  double tPercent;
  double ePercent;
  double fPercent;
  Record(
      {required this.footPrintCurrentMonth,
      required this.month,
      required this.transportSum,
      required this.electricitySum,
      required this.foodSum,
      required this.tPercent,
      required this.ePercent,
      required this.fPercent});
}
