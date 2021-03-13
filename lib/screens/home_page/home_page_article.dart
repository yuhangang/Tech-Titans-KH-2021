import 'package:flutter/material.dart';
import 'package:tech_titans/core/alert/article_content.dart';

class Article extends StatelessWidget {
  const Article({
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
            padding: const EdgeInsets.all(30),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Article of the Week",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 20),
                ))),
        DataTable(
            showCheckboxColumn: false,
            headingRowHeight: 20,
            dataTextStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            columns: [
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
                    DataCell(Text("Bitcoin's price is skyrocketing — so is its carbon footprint")),
                    DataCell(Text("5 min"))
                  ]),
            ]),
      ],
    );
  }
}
