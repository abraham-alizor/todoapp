import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/pages/todo.dart';

void main() async {
  await Hive.initFlutter();

  //open a hive box
  var box = await Hive.openBox('todoBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {}, debugShowCheckedModeBanner: false, home: TodoLanding());
  }
}
