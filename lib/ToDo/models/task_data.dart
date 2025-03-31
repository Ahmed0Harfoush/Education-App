// import 'package:education_app/ToDo/models/task.dart';
// import '../database/database.dart';
// import 'package:flutter/foundation.dart';
//
// class TaskData extends ChangeNotifier {
//   List<Task> tasks = [];
//
//   TaskData() {
//     loadTasks();
//   }
//
//   Future<void> loadTasks() async {
//     tasks = await DatabaseHelper().getTasks();
//     notifyListeners();
//   }
//
//   void addTask(String newTaskTitle) async {
//     Task task = Task(name: newTaskTitle);
//     await DatabaseHelper().insertTask(task);
//     tasks.add(task);
//     notifyListeners();
//   }
//
//   void updateTask(Task task) async {
//     task.doneChange();
//     await DatabaseHelper().updateTask(task);
//     notifyListeners();
//   }
//
//   void deleteTask(Task task) async {
//     await DatabaseHelper().deleteTask(task);
//     tasks.remove(task);
//     notifyListeners();
//   }
// }


















import 'package:education_app/ToDo/models/task.dart';
import '../database/database.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  TaskData() {
    loadTasks();
  }

  Future<void> loadTasks() async {
    tasks = await DatabaseHelper().getTasks();
    notifyListeners();
  }

  void addTask(String newTaskTitle) async {
    Task task = Task(name: newTaskTitle);
    await DatabaseHelper().insertTask(task);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.doneChange();
    await DatabaseHelper().updateTask(task);
    notifyListeners();
  }

  void deleteTask(Task task) async {
    await DatabaseHelper().deleteTask(task);
    tasks.remove(task);
    notifyListeners();
  }
}
