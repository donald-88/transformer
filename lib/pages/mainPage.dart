import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transformer/pages/tabs/controlPanel.dart';
import 'tabs/home.dart';
import 'tabs/notifications.dart';
import 'tabs/profile.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  //receive sms
  int count = 0;
  String myMessage = "";
  String location = "Blantyre, Umoyo House";
  String sender = "";
  DateTime date = DateTime.now();

  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 3;
  bool pirStatus = true;

  @override
  Widget build(BuildContext context) {
    List screens = [
      Home(pirStatus: pirStatus),
      const Notifications(),
      ControlPanel(onBatteryStatusChange: (){}),
      Profile()
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(label: "", icon: Icon(Iconsax.home)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Iconsax.notification)),
            BottomNavigationBarItem(label: "", icon: Icon(Iconsax.candle_2)),
            BottomNavigationBarItem(label: "", icon: Icon(Iconsax.user))
          ]),
    );
  }
}
