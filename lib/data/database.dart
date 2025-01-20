import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoLists = [];
  //reference our box
  final _myBox = Hive.box('todoBox');

  //initial method - run this method when the app runs for the first time
  void init() {
    todoLists = [
      {"taskName": "Make tutorial", "checkValue": true},
      {"taskName": "Do exercise", "checkValue": true},
      {"taskName": "Write codes", "checkValue": true},
    ];
  }

  //load the data from the box
  void loadData() {
    todoLists = _myBox.get('todoList');
  }

  //update the data in the box
  void updateDataBase() {
    _myBox.put('todoList', todoLists);
  }
}
