import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sms/sms.dart';
import 'package:transformer/screens/home.dart';
import 'package:transformer/screens/notifications.dart';
import 'package:transformer/screens/stats.dart';

class LocationView extends StatefulWidget {
  //receive sms
  int count = 0;
  String myMessage = "";
  String location = "Blantyre, Umoyo House";
  String sender = "";
  DateTime date = DateTime.now();

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  //reference to hive box
  final _myBox = Hive.box('myBox');

  Future<void> _addAlert(alert) async {
    _myBox.add(alert);
  }

  @override
  void initState() {
    super.initState();

    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      setState(() {
        widget.myMessage = msg.body;
      });

      //add alert to hive box
      _addAlert(widget.myMessage);
    });
  }

  int currentIndex = 0;
  List screens = [Home(), Notifications(), Stats()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(label: "", icon: Icon(Iconsax.home)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Iconsax.notification)),
            BottomNavigationBarItem(label: "", icon: Icon(Iconsax.calendar_2))
          ]),
    );
  }
}
