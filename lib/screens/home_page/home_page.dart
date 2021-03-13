import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/components/custom_app_bar.dart';
import 'package:tech_titans/core/push_notification/src/notification_show/notification_helper.dart';
import 'package:tech_titans/providers/auth_provider.dart';
import 'package:tech_titans/screens/account/account_page.dart';
<<<<<<< Updated upstream
=======
import 'package:tech_titans/screens/home_page/home_page_me.dart';
import 'package:tech_titans/screens/home_page/widgets/sphere.dart';
import 'package:tech_titans/screens/statistics/line_chart.dart';

import 'home_page_leaderboard.dart';
import 'home_page_me.dart';

import 'homepage_dashboard.dart';
import 'home_page_article.dart';
>>>>>>> Stashed changes

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      LocalNotificationHelper.showLocalNotification(message: "true");
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
=======
    final screenWidth = MediaQuery.of(context).size.width;

    var children2 = [DashBoard(), ConsumptionChart(), LeaderBoard(), Article(), Me()];
    var appTitles = ["Dashboard", "Statistics", "Leaderboard", "Articles", "Me"];

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
              icon: Icon(CupertinoIcons.globe), label: "explore"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news), label: "article"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "me")
        ],
      ),
>>>>>>> Stashed changes
      appBar: CustomAppBar(
        title: "HOME",
        leading: Container(),
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AccountPage.route);
              })
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
