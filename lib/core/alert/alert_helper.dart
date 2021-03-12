import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_titans/core/alert/monthly_dialog.dart';

abstract class AlertDialogHelper {
  AlertDialogHelper();

  static void showMonthlyDialog() {
    showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return MonthlyDialog(
            title: "Custom Dialog Demo",
            descriptions:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            text: "Yes",
          );
        });
  }
}
