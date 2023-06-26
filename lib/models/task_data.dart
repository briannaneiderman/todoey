import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskCount => tasks.length;

  void addItem(String enteredName) {
    tasks.add(Task(name: enteredName));
    notifyListeners();
  }
  void checkItem(Task task) {
    task.toggleDone();
    notifyListeners();
  }
  void deleteItem(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}