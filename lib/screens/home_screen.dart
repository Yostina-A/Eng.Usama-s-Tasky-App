import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/screens/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username = "friend";
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _getUserName();
    _loadTasks();
  }

  void _getUserName() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString("username");
    });
  }

  void _loadTasks() async {
    final pref = await SharedPreferences.getInstance();
    final retrievedJsonTasks = pref.getString("tasks");

    if (retrievedJsonTasks != null) {
      List<dynamic> tasksDecoded = jsonDecode(retrievedJsonTasks);
      setState(() {
        tasks = tasksDecoded.map((element) {
          return TaskModel.fromJson(element);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 44,
        child: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AddTask();
                },
              ),
            );
            _loadTasks();
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
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
              if (tasks.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    padding: EdgeInsets.only(bottom: 60),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsetsGeometry.only(top: 8),
                        child: Container(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFF282828),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // the row of each task components
                          child: Row(
                            children: [
                              Checkbox(
                                value: tasks[index].isDone,
                                onChanged: (value) async {
                                  setState(() {
                                    tasks[index].isDone = value ?? false;
                                  });
                                  final pref =
                                      await SharedPreferences.getInstance();
                                  final updatedTasks = tasks
                                      .map((element) => element.toJson())
                                      .toList();
                                  await pref.setString(
                                    "tasks",
                                    jsonEncode(updatedTasks),
                                  );
                                },
                                activeColor: Color(0xFF15B86C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //task name
                                    Text(
                                      tasks[index].taskName,
                                      style: TextStyle(
                                        color: tasks[index].isDone
                                            ? Color(0xFFA0A0A0)
                                            : Color(0xFFFFFCFC),
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationColor: Color(0xFFA0A0A0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                    //task decription
                                    if(tasks[index].taskDescription.isNotEmpty)
                                    Text(
                                      tasks[index].taskDescription,
                                      style: TextStyle(
                                        color: tasks[index].isDone
                                            ? Color(0xFFA0A0A0)
                                            : Color(0xFFFFFCFC),
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationColor: Color(0xFFA0A0A0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert),
                                color: tasks[index].isDone
                                    ? Color(0xFFA0A0A0)
                                    : Color(0xFFFFFCFC),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
