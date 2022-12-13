import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  //reference hive box
  final _myBox = Hive.box('myBox');

  var rowItems = [];

  @override
  void initState() {
    super.initState();
    for (var i in _myBox.values) {
      rowItems.add(RowItem("14-12-22", "Intrusion", "Blantyre", false));
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle normal =
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
    TextStyle tableHeader =
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold);
    return Scaffold(
        body: SizedBox(
      child: Column(
        children: [
          Center(
            child: Text(
              'History',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Date',
                  style: tableHeader,
                )),
                DataColumn(label: Text('Alert', style: tableHeader)),
                DataColumn(label: Text('Location', style: tableHeader)),
                DataColumn(label: Text('Response', style: tableHeader))
              ],
              rows: rowItems
                  .map((e) => DataRow(cells: [
                        DataCell(Text("14-12-22", style: normal)),
                        DataCell(Text("Intrusion", style: normal)),
                        DataCell(Text("Blantyre", style: normal)),
                        DataCell(Text("false", style: normal)),
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
