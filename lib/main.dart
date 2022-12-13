import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transformer/locationView.dart';
import 'package:transformer/screens/fake-map.dart';
import 'package:transformer/screens/home.dart';
import 'package:transformer/screens/notifications.dart';
import 'package:transformer/screens/stats.dart';

void main() async {
  //initialise hive
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: Colors.green,
          brightness: Brightness.dark,
          useMaterial3: true),
      home: LocationView(),
      routes: {
        'home': (context) => Home(),
        'notification': (context) => Notifications(),
        'map': (context) => FakeMap(),
        'stats': (context) => Stats(),
      },
    );
  }
}
