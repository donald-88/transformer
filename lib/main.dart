import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transformer/pages/authentication/authGate.dart';
import 'package:transformer/pages/fake-map.dart';
import 'package:transformer/pages/home.dart';
import 'package:transformer/pages/notifications.dart';
import 'package:transformer/pages/controlPanel.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const AuthGate(),
      routes: {
        'home': (context) => const Home(),
        'notification': (context) => const Notifications(),
        'map': (context) => FakeMap(),
        'stats': (context) => const Stats(),
      },
    );
  }
}
