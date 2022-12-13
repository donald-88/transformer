import 'package:hive_flutter/hive_flutter.dart';

class MyDatabase {
  List alerts = [1];

  //reference to hive box
  final _myBox = Hive.box('myBox');

  //create initial data
  void createInitialData() {
    alerts = [];
  }

  void loadData() {
    alerts = _myBox.get('alerts');
  }

  void saveData() {
    _myBox.put('alerts', alerts);
  }
}
