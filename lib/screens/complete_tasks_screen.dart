import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/widgets/task_list_widget.dart';

class CompleteTasksScreen extends StatefulWidget {
  const CompleteTasksScreen({super.key});

  @override
  State<CompleteTasksScreen> createState() => _CompleteTasksScreenState();
}

class _CompleteTasksScreenState extends State<CompleteTasksScreen> {
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
        tasks = tasks.where((task) => task.isDone).toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Completed Tasks")),
      body: Center(
        child: TaskListWidget(
          tasks: tasks,
          onTap: (bool? value, int? index) async {
            {
              setState(() {
                tasks[index!].isDone = value ?? false;
              });
              final pref = await SharedPreferences.getInstance();

              final allPreviousTasks = pref.getString("tasks");
              if (allPreviousTasks != null) {
                List<TaskModel> previousTaskList =
                    (jsonDecode(allPreviousTasks) as List<dynamic>)
                        .map((element) => TaskModel.fromJson(element))
                        .toList();
                // this is where we get the idex of the tasks we're in from the main list (in
                // home screen) not the current "completed" task list
                int currentTaskIndex = previousTaskList.indexWhere(
                  (e) => e.id == tasks[index!].id,
                );
                // this replaces the old data in the old main list with the new
                //status of the task
                previousTaskList[currentTaskIndex] = tasks[index!];
                await pref.setString("tasks", jsonEncode(previousTaskList));
                _loadTasks();
              }
            }
          },
          emptyMessage: "No Tasks Found",
        ),
      ),
    );
  }
}
