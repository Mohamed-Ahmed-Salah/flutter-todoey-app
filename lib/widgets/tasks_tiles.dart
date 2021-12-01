import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final checkBoxCallbakc;

  final longPress;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkBoxCallbakc,this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPress ,
      title: Text(
        '$taskTitle',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallbakc,
      ),
    );
  }
} /*
setState(() {
isChecked = newValue!;
});*/
