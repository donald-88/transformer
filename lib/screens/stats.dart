import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  var rowItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Column(
        children: [
          const Center(
            child: Text(
              "History"
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DataTable(
              columns: const [
                DataColumn(
                    label: Text(
                  'Date',
                )),
                DataColumn(label: Text('Alert')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Response'))
              ],
              rows: rowItems
                  .map((e) => const DataRow(cells: [
                        DataCell(Text("14-12-22")),
                        DataCell(Text("Intrusion")),
                        DataCell(Text("Blantyre")),
                        DataCell(Text("false")),
                      ]))
                  .toList()),
        ],
      ),
    ));
  }
}

class RowItem {
  final String date;
  final String alert;
  final String location;
  final bool response;

  RowItem(this.date, this.alert, this.location, this.response);
}
