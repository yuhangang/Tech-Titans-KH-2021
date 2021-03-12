import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/components/custom_app_bar.dart';
import 'package:tech_titans/core/alert/alert_helper.dart';
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
    //Future.delayed(Duration.zero, () => AlertDialogHelper.showMonthlyDialog());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
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
        child: Container(
          width: screenWidth,
          height: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Carbon Footprint in this Month',
                ),
              ),
              EarthItem(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("total Distance travelled"),
                        Text("10 km")
                      ],
                    ),
                  ),
                  Text("total Eletricity Consumed"),
                  Text("total House Consumed")
                ],
              )
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
      ),

// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class EarthItem extends StatelessWidget {
  const EarthItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Consumer<SummaryProvider>(
        builder: (_, summaryProvider, child) {
          return Container(
            width: 200,
            height: 200,
            child: Center(
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: summaryProvider.footPrintCurrentMonth > 100
                        ? Colors.yellow[400]
                        : Colors.green,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Flexible(
                        flex: 3,
                        child: Center(
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        summaryProvider.getUnitName(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white, fontSize: 20),
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
    );
  }
}
