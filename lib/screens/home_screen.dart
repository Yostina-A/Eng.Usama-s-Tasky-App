import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/widgets/achieved_tasks_widget.dart';
import 'package:tasky/widgets/high_priority_tasks_widget.dart';
import 'package:tasky/widgets/sliver_task_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username = "friend";
  List<TaskModel> tasks = [];
  bool isLoading = false;
  int totalTasksDone = 0;
  int totalTasks = 0;
  double donePercentage = 0;

  @override
  void initState() {
    super.initState();
    _getUserName();
    _loadTasks();
  }

  void _getUserName() async {
    setState(() {
      username = PrefrencesManager().getString("username");
    });
  }

  void _loadTasks() async {
    setState(() {
      isLoading = true;
    });

    final retrievedJsonTasks = PrefrencesManager().getString("tasks");

    if (retrievedJsonTasks != null) {
      List<dynamic> tasksDecoded = jsonDecode(retrievedJsonTasks);
      setState(() {
        tasks = tasksDecoded.map((element) {
          return TaskModel.fromJson(element);
        }).toList();
      });
    }
    setState(() {
      isLoading = false;
      _calDonePercentage();
    });
  }

  double _calDonePercentage() {
    totalTasks = tasks.length;
    totalTasksDone = tasks.where((e) => e.isDone).length;
    donePercentage = totalTasks == 0 ? 0 : totalTasksDone / totalTasks;
    return donePercentage;
  }

  void _updateTasks(bool? value, int? index) async {
    setState(() {
      tasks[index!].isDone = value ?? false;
      _calDonePercentage();
    });

    final updatedTasks = tasks.map((element) => element.toJson()).toList();
    await PrefrencesManager().setString("tasks", jsonEncode(updatedTasks));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 44,
        child: FloatingActionButton.extended(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AddTask();
                },
              ),
            );
            if (result != null && result) {
              _loadTasks();
            }
          },
          backgroundColor: Color(0xFF15B86C),
          foregroundColor: Color(0xFFFFFCFC),
          icon: Icon(Icons.add),
          label: Text("Add New Task", style: TextStyle(fontSize: 16)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/avatar.png",
                        width: 42,
                        height: 42,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Evening, $username",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              //decoration: tasks[index].isDone? TextDecoration.strikethrough : TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "One task at a time. One step closer.",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Yuhuu ,Your work Is ",
                    style: TextStyle(
                      color: Color(0xFFFFFCFC),
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "almost done ! ",
                        style: TextStyle(
                          color: Color(0xFFFFFCFC),
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset("assets/images/waving-hand.svg"),
                    ],
                  ),
                  SizedBox(height: 16),
                  AchievedTasksWidget(
                    totalTasksDone: totalTasksDone,
                    totalTasks: totalTasks,
                    donePercentage: donePercentage,
                  ),
                  SizedBox(height: 8),
                  HighPriorityTasksWidget(
                    tasks: tasks,
                    onTap: (bool? value, int? index) {
                      _updateTasks(value, index);
                    },
                    refresh: () {
                      _loadTasks();
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            isLoading
                ? SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SliverTaskListWidget(
                    tasks: tasks,
                    onTap: (bool? value, int? index) {
                      _updateTasks(value, index);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
