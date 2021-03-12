import 'package:flutter/material.dart';
import 'package:tech_titans/core/alert/alert_helper.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserTable(),
                SizedBox(
                  height: 20,
                ),
                CountryTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Yearly Reductions",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 20),
                ))),
        DataTable(
            showCheckboxColumn: false,
            headingRowHeight: 10,
            dataTextStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
            columns: [
              DataColumn(label: SizedBox(), numeric: true),
              DataColumn(label: SizedBox()),
              DataColumn(label: SizedBox(), numeric: true)
            ],
            rows: [
              DataRow(
                  color: MaterialStateProperty.all<Color>(
                      Colors.lightGreen.withOpacity(0.2)),
                  onSelectChanged: (_) {
                    AlertDialogHelper.showLeaderDialog();
                  },
                  cells: [
                    DataCell(Text("1")),
                    DataCell(Text("A Anonymous Cat")),
                    DataCell(Text("95.6 %"))
                  ]),
              DataRow(cells: [
                DataCell(Text("2")),
                DataCell(Text("DogeCoin to the Moon")),
                DataCell(Text("94.0 %")),
              ]),
              DataRow(cells: [
                DataCell(Text("3")),
                DataCell(Text("YOLO")),
                DataCell(Text("93.7 %")),
              ]),
            ]),
      ],
    );
  }
}

class CountryTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Avg Yearly Reduction by Countries",
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
              DataColumn(label: SizedBox(), numeric: true),
              DataColumn(label: SizedBox()),
              DataColumn(label: SizedBox(), numeric: true)
            ],
            rows: [
              DataRow(cells: [
                DataCell(SizedBox(
                    height: 30,
                    width: 30,
                    child:
                        ClipOval(child: Image.asset('assets/images/my.png')))),
                DataCell(Text("Malaysia")),
                DataCell(Text("24.6 %"))
              ]),
              DataRow(cells: [
                DataCell(SizedBox(
                    height: 30,
                    width: 30,
                    child:
                        ClipOval(child: Image.asset('assets/images/sg.png')))),
                DataCell(Text("Singapore")),
                DataCell(Text("18.0 %")),
              ]),
              DataRow(cells: [
                DataCell(SizedBox(
                    height: 30,
                    width: 30,
                    child:
                        ClipOval(child: Image.asset('assets/images/id.png')))),
                DataCell(Text("Indonesia")),
                DataCell(Text("15.7 %")),
              ]),
            ]),
      ],
    );
  }
}
