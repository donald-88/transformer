import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transformer/locationView.dart';

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
    );
  }
}
