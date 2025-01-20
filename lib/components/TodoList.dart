import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final bool checkValue;
  final String taskName;
  SlidableActionCallback? deleteTask;
  SlidableActionCallback? editTask;
  final Function(bool?)? onChanged;

  TodoList({
    super.key,
    required this.onChanged,
    required this.checkValue,
    required this.taskName,
    required this.deleteTask,
    this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // startActionPane: ,
      endActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          // SlidableAction(
          //   onPressed: editTask,
          //   icon: Icons.edit,
          //   backgroundColor: Colors.blue,
          //   foregroundColor: Colors.white,
          // ),
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: checkValue,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
