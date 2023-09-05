import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transformer/locationView.dart';
import 'package:transformer/screens/fake-map.dart';
import 'package:transformer/screens/home.dart';
import 'package:transformer/screens/notifications.dart';
import 'package:transformer/screens/controlPanel.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData(brightness: Brightness.light);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff097134),
          textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme.apply(
              bodyColor: const Color(0xff097134),
              displayColor: const Color(0xff097134))),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true),
      home: LocationView(),
      routes: {
        'home': (context) => const Home(),
        'notification': (context) => const Notifications(),
        'map': (context) => FakeMap(),
        'stats': (context) => const Stats(),
      },
    );
  }
}
