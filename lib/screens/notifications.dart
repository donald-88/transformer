import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transformer/database.dart';
import 'package:transformer/widgets/notification-card.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  //reference to hive box
  final _myBox = Hive.box('myBox');

  MyDatabase db = MyDatabase();

  //read data
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle heading =
        GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Center(
              child: Text(
            "Notifications",
            style: heading,
          )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: db.alerts.length,
              itemBuilder: (context, index) {
                return NotificationCard();
              }),
        )
      ],
    );
  }
}
