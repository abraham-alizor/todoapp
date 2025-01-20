import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/components/DialogBox.dart';
import 'package:my_app/components/TodoList.dart';
import 'package:my_app/data/database.dart';

class TodoLanding extends StatefulWidget {
  const TodoLanding({super.key});

  @override
  State<TodoLanding> createState() => _TodoLandingState();
}

class _TodoLandingState extends State<TodoLanding> {
  TextEditingController _controller = TextEditingController();
  final _myBox = Hive.box('todoBox');

  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
//first time runing the app
    if (_myBox.get('todoList') == null) {
      db.init();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoLists.add({
          "taskName": _controller.text,
          "checkValue": false,
        });
      });
      _controller.clear();
      db.updateDataBase();
      Navigator.pop(context);
    }
  }

  void AddTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoLists[index]['checkValue'] = value;
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: AddTask,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "Slide to delete a task",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: db.todoLists.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TodoList(
                    taskName: db.todoLists[index]['taskName'],
                    checkValue: db.todoLists[index]['checkValue'],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteTask: (context) => setState(() {
                      db.todoLists.removeAt(index);
                      db.updateDataBase();
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
