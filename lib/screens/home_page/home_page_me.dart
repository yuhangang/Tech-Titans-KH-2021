import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/main.dart';
import 'package:tech_titans/providers/summary_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Me extends StatelessWidget {
  const Me({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CharacterItem(),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Powers:",
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
                  DataColumn(label: SizedBox(width: 0)),
                  DataColumn(label: SizedBox(width: 200)),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("Health:")),
                    DataCell(Center(
                        child: FAProgressBar(
                            size: 200,
                            direction: Axis.horizontal,
                            currentValue: 80,
                            progressColor: Colors.green)))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Attack:")),
                    DataCell(Center(
                        child: FAProgressBar(
                            size: 200,
                            direction: Axis.horizontal,
                            currentValue: 60,
                            progressColor: Colors.red)))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Intelligence:")),
                    DataCell(Center(
                        child: FAProgressBar(
                            size: 200,
                            direction: Axis.horizontal,
                            currentValue: 40,
                            progressColor: Colors.blue)))
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}

class CharacterItem extends StatefulWidget {
  const CharacterItem({
    Key? key,
  }) : super(key: key);

  @override
  _CharacterItemState createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Image boyImage;
  @override
  void initState() {
    boyImage = Image.asset('assets/images/boy.png', fit: BoxFit.contain);
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this)
          ..repeat();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(boyImage.image, context);
    super.didChangeDependencies();
  }

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
                  Container(
                    alignment: Alignment(-0.6, 0),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: 0.1,
                          child: boyImage,
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment(0.0, 1.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Alex",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 25),
                        )
                      ],
                    ),
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
