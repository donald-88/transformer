import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transformer/pages/tabs/controlPanel.dart';
import 'package:web_socket_channel/io.dart';

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
  final channel =
      IOWebSocketChannel.connect(Uri.parse('ws://192.168.2.10:81'));
  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      if(message.toString().startsWith("PIR")){
        setState(() {
          pirStatus = true;
        });
      }
    });
  }

  int currentIndex = 0;
  bool pirStatus = false;

  @override
  Widget build(BuildContext context) {
    List screens = [
      Home(pirStatus: pirStatus),
      const Notifications(),
      ControlPanel(onBatteryStatusChange: ()=> sendWebSocketMessage("")),
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

  void sendWebSocketMessage(String message) {
    channel.sink.add(message);
  }
}
