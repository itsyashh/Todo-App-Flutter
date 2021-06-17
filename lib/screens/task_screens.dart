import 'package:flutter/material.dart';
import 'package:todo_assignment/module/task_list.dart';

class TaskListscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        child: TaskList(),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
