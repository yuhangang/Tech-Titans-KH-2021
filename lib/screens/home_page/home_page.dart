import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/components/custom_app_bar.dart';
import 'package:tech_titans/core/alert/alert_helper.dart';
import 'package:tech_titans/core/app_preference.dart';
import 'package:tech_titans/core/push_notification/src/notification_show/notification_helper.dart';
import 'package:tech_titans/core/push_notification/src/notification_show/show_notification.dart';
import 'package:tech_titans/providers/auth_provider.dart';
import 'package:tech_titans/providers/summary_provider.dart';
import 'package:tech_titans/screens/account/account_page.dart';
import 'package:tech_titans/screens/home_page/widgets/sphere.dart';

import 'home_page_leaderboard.dart';
import 'homepage_dashboard.dart';

class MyHomePage extends StatefulWidget {
  static const route = "/my-home-page";

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  PageController pageController = new PageController();

  @override
  void initState() {
    LocalNotificationHelper.showLocalNotification(
        message: "Your Month Survey is ready");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var children2 = [DashBoard(), Scaffold(), LeaderBoard()];
    var appTitles = ["Dashboard", "Statistics", "Leaderboard"];
    //Future.delayed(Duration.zero, () {
    //  AlertDialogHelper.showSurveyDialog();
    //});
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (_) {
          if (_ == index) return;
          setState(() {
            if ((_ - index).abs() > 1) {
              index = _;
              pageController.jumpToPage(_);
            } else {
              index = _;
              pageController.animateToPage(_,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut);
            }
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "dashboard"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar), label: "stat"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.globe), label: "explore")
        ],
      ),
      appBar: CustomAppBar(
        title: index == 0 ? "${appTitles[index]}" : appTitles[index],
        showLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.clock,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                LocalNotificationHelper.showLocalNotification(
                    message: "Your Month Survey is ready");
              }),
          IconButton(
              icon: Icon(
                CupertinoIcons.settings,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AccountPage.route);
              }),
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Provider.of<SummaryProvider>(context, listen: false).reset();
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (_) {
          if (_ != index) {
            setState(() {
              index = _;
            });
          }
        },
        children: children2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<SummaryProvider>(context, listen: false)
              .setfootPrintCurrentMonth(
                  Provider.of<SummaryProvider>(context, listen: false)
                          .footPrintCurrentMonth +
                      100);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
