import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(title: json['title'], isCompleted: json['isCompleted']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'isCompleted': isCompleted};
  }
}

// class HomeController extends GetxController {
//   var tasks = <Task>[].obs;
//
//   void addTask(String title) {
//     if (title.isNotEmpty) {
//       tasks.add(Task(title: title));
//     }
//   }
//
//   void toggleTask(int index) {
//     var task = tasks[index];
//     task.isCompleted = !task.isCompleted;
//     tasks[index] = task;
//   }
// }

class HomeController extends GetxController {
  var tasks = <Task>[].obs;
  final String _key = 'tasks';

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title));
      saveTasks();
    }
  }

  void toggleTask(int index) {
    var task = tasks[index];
    task.isCompleted = !task.isCompleted;
    tasks[index] = task;
    saveTasks();
  }

  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> taskList = tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList(_key, taskList);
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList(_key);
    if (taskList != null) {
      tasks.value = taskList
          .map((taskJson) => Task.fromJson(jsonDecode(taskJson)))
          .toList();
    }
  }
}

