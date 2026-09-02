import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';
import 'dart:convert';

import 'package:tasky/widgets/task_list_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskModel> tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    setState(() {
      isLoading = true;
    });
    final pref = await SharedPreferences.getInstance();
    final retrievedJsonTasks = pref.getString("tasks");

    if (retrievedJsonTasks != null) {
      List<dynamic> tasksDecoded = jsonDecode(retrievedJsonTasks);
      setState(() {
        tasks = tasksDecoded.map((element) {
          return TaskModel.fromJson(element);
        }).toList();
        tasks = tasks.where((task) => task.isDone == false).toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do Taks")),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: isLoading
              ? Center(child: CircularProgressIndicator(value: 20))
              : TaskListWidget(
                emptyMessage: "No Tasks Found",
                  tasks: tasks,
                  onTap: (bool? value, int? index) async {
                    setState(() {
                      tasks[index!].isDone = value ?? false;
                    });
                    final pref = await SharedPreferences.getInstance();
                    final updatedTasks = tasks
                        .map((element) => element.toJson())
                        .toList();
                    await pref.setString("tasks", jsonEncode(updatedTasks));
                    _loadTasks();
                  },
                ),
        ),
      ),
    );
  }
}
