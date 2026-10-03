import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/widgets/task_list_widget.dart';

class HighPriorityScreen extends StatefulWidget {
  const HighPriorityScreen({super.key});

  @override
  State<HighPriorityScreen> createState() => _HighPriorityScreenState();
}

class _HighPriorityScreenState extends State<HighPriorityScreen> {
  List<TaskModel> highPriorityTasks = [];
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

    final retrievedJsonTasks = PrefrencesManager().getString("tasks");

    if (retrievedJsonTasks != null) {
      List<dynamic> tasksDecoded = jsonDecode(retrievedJsonTasks);
      setState(() {
        highPriorityTasks = tasksDecoded.map((element) {
          return TaskModel.fromJson(element);
        }).toList();
        highPriorityTasks = highPriorityTasks
            .where((task) => task.isHighPriority)
            .toList();

        highPriorityTasks = highPriorityTasks.reversed.toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("High Prioroity Tasks")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: isLoading
            ? Center(child: CircularProgressIndicator(value: 20))
            : TaskListWidget(
                emptyMessage: "No Tasks Found",
                tasks: highPriorityTasks,
                onTap: (bool? value, int? index) async {
                  setState(() {
                    highPriorityTasks[index!].isDone = value ?? false;
                  });

                  final allPreviousTasks = PrefrencesManager().getString(
                    "tasks",
                  );
                  if (allPreviousTasks != null) {
                    List<TaskModel> previousTaskList =
                        (jsonDecode(allPreviousTasks) as List<dynamic>)
                            .map((element) => TaskModel.fromJson(element))
                            .toList();
                    // this is where we get the idex of the tasks we're in from the main list (in
                    // home screen) not the current "undone" to-do list
                    int currentTaskIndex = previousTaskList.indexWhere(
                      (e) => e.id == highPriorityTasks[index!].id,
                    );
                    // this replaces the old data in the old main list with the new
                    //status of the task
                    previousTaskList[currentTaskIndex] =
                        highPriorityTasks[index!];
                    await PrefrencesManager().setString(
                      "tasks",
                      jsonEncode(previousTaskList),
                    );
                    _loadTasks();
                  }
                },
              ),
      ),
    );
  }
}
