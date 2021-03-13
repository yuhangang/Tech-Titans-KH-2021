import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_titans/components/intro_slider/intro_slider.dart';
import 'package:tech_titans/core/alert/article_dialog.dart';

abstract class AlertDialogHelper {
  AlertDialogHelper();

  static void showLeaderDialog() {
    showDialog(
        context: Get.key!.currentContext!,
        builder: (BuildContext context) {
          return LeaderDialog(
            title: "Bitcoin's price is skyrocketing — so is its carbon footprint",
            descriptions:
                "As the price of bitcoin soars past USD56,000, the cryptocurrency's negative environmental impact is becoming harder to ignore. Energy-hogging crypto miners have been blamed for power outages in Iran, while China — a crypto mining hotbed — is cracking down on the practice as it takes a heavier hand with polluting industries. More such crackdowns may be needed to keep crypto's carbon emissions under control. According to research released this week, bitcoin's record-high prices have created a crypto mining backlog such that, even if the price falls, emissions from mining the virtual currency are likely to stay high for the near future. While there are only about 1 million bitcoin miners in the world, according to an industry estimate, the amount of electricity that mining consumes in one year is equal to that used to power Malaysia, Sweden or Ukraine, according to the Cambridge Bitcoin Electricity Consumption Index.",
            text: "Yes",
            img: Image.asset('assets/images/bitcoin.png'),
          );
        });
  }

  static void showSurveyDialog() {
    showDialog(
        useSafeArea: false,
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return IntroPage();
        });
  }
}
