import 'package:flutter/material.dart';
import 'package:my_app/components/PrimaryButton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: Container(
          height: 300,
          child: Column(children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter task name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(onPressed: onCancel, ButtonName: "Cancel"),
                SizedBox(width: 8),
                PrimaryButton(onPressed: onSave, ButtonName: 'Add Task'),
              ],
            )
          ])),
    );
  }
}
