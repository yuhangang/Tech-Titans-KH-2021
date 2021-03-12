import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/main.dart';
import 'package:tech_titans/providers/summary_provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            EarthItem(),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "By categories",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 20),
                    ))),
            DataTable(
                headingRowHeight: 10,
                dataTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                columns: [
                  DataColumn(label: SizedBox()),
                  DataColumn(label: SizedBox(), numeric: true),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("Transport")),
                    DataCell(Text("53 %"))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Electricity")),
                    DataCell(Text("32 %")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Food & Groceries")),
                    DataCell(Text("15 %")),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}

class EarthItem extends StatefulWidget {
  const EarthItem({
    Key? key,
  }) : super(key: key);

  @override
  _EarthItemState createState() => _EarthItemState();
}

class _EarthItemState extends State<EarthItem>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Image earthImage;
  @override
  void initState() {
    earthImage = Image.asset('assets/images/earth.png', fit: BoxFit.fitWidth);
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 35))
          ..repeat();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(earthImage.image, context);
    super.didChangeDependencies();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth / 10),
      child: Consumer<SummaryProvider>(
        builder: (_, summaryProvider, child) {
          return Container(
            width: screenWidth * 0.7,
            height: screenWidth * 0.7,
            child: Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: Container(
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: _controller.value * 2 * pi,
                            child: earthImage,
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "CO",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 25),
                        ),
                        Text("2")
                      ],
                    ),
                  ),
                  ClipOval(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      decoration: BoxDecoration(
                          color: (summaryProvider.footPrintCurrentMonth > 100
                                  ? Color(0xFFC78800)
                                  : Colors.green[600])!
                              .withOpacity(0.4)),
                    ),
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
                                  .copyWith(color: Colors.white, shadows: [
                                Shadow(
                                    blurRadius: 20,
                                    color: Colors.black.withOpacity(0.4))
                              ]),
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
