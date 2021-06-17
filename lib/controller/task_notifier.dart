import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_assignment/module/task.dart';

class TaskNotifier extends ChangeNotifier {
  List<Task> _taskList = [];
  String date;
  String taskName;
  String details;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);
  addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  deleteTask(index) {
    _taskList
        .removeWhere((_task) => _task.taskName == taskList[index].taskName);
    notifyListeners();
  }
}
