import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:education_app/ToDo/models/task_data.dart'; // Import TaskData
import 'screens/tasks_screen.dart'; // Import your TasksScreen

class TasksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(), // Initialize TaskData provider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(), // Your home screen
      ),
    );
  }
}