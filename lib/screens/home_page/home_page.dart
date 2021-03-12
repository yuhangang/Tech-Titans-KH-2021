import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/components/custom_app_bar.dart';
import 'package:tech_titans/core/push_notification/src/notification_show/notification_helper.dart';
import 'package:tech_titans/providers/auth_provider.dart';
import 'package:tech_titans/providers/summary_provider.dart';
import 'package:tech_titans/screens/account/account_page.dart';
import 'package:tech_titans/screens/home_page/widgets/sphere.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                CupertinoIcons.settings,
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
        child: Container(
          width: screenWidth,
          height: screenWidth,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Carbon Footprint in this Month',
                ),
              ),
              ClipOval(
                child: Consumer<SummaryProvider>(
                  builder: (_, summaryProvider, child) {
                    return Container(
                      color: Colors.green,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      summaryProvider.getUnitNumString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  summaryProvider.getUnitName(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<SummaryProvider>(context, listen: false)
              .setfootPrintCurrentMonth(
                  Provider.of<SummaryProvider>(context, listen: false)
                          .footPrintCurrentMonth +
                      1000);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
