import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transformer/database.dart';

class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  //reference hive box
  final _myBox = Hive.box('myBox');

  MyDatabase db = MyDatabase();

  @override
  void initState() {
    super.initState();
    db.loadData();
  }

  final List<RowItem> _rowItems = [];

  @override
  Widget build(BuildContext context) {
    for (var element in db.alerts) {
      _rowItems.add(RowItem(element['date'], element['alert'],
          element['location'], element['response']));
    }
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
              rows: _rowItems
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.date.toString(), style: normal)),
                        DataCell(Text(e.alert, style: normal)),
                        DataCell(Text(e.location, style: normal)),
                        DataCell(Text(e.response.toString(), style: normal)),
                      ]))
                  .toList()),
        ],
      ),
    ));
  }
}

class RowItem {
  final int date;
  final String alert;
  final String location;
  final bool response;

  RowItem(this.date, this.alert, this.location, this.response);
}
