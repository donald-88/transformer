import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  Color noAlertColor = Colors.white;
  Color alertColor = Colors.red;

  //reference to hive box
  final _myBox = Hive.box('myBox');

  

  @override
  Widget build(BuildContext context) {

    TextStyle numbers = GoogleFonts.poppins(
        fontSize: 64, fontWeight: FontWeight.w400, color: _myBox.length == 0 ? noAlertColor : alertColor);
    TextStyle alerts =
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: _myBox.length == 0 ? noAlertColor : alertColor);

    double width = MediaQuery.of(context).size.width;
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'notification');
        },
        child: Container(
          height: width - 80,
          width: width - 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(width)),
              border: Border.all(
                  width: 2, color: _myBox.length == 0 ? noAlertColor : alertColor)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(_myBox.length.toString(), style: numbers),
              Positioned(
                  bottom: 50, child: Text("Alerts registered.", style: alerts))
            ],
          ),
        ),
      ),
    );
  }
}

class AlertNotification {
  final String message;
  final String location;
  final DateTime date;
  final String sender;

  AlertNotification(
      {required this.message,
      required this.location,
      required this.date,
      required this.sender});
}
