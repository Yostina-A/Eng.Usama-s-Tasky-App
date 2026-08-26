import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_svg/svg.dart';
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
    final retrievedTasks = pref.getString("tasks");
    // print("retrieved tasks: $retrievedTasks");
    if (retrievedTasks != null) {
      List<dynamic> taskListDecoded =
          jsonDecode(retrievedTasks) as List<dynamic>;
      // print("Task after Decoding: $taskListDecoded");

      //maping each element inside the list to the TaskModel class
      final tasksModeled = taskListDecoded.map((element) {
        return TaskModel(
          taskName: element["taskName"],
          taskDescription: element["taskDescription"],
          isHighPriority: element["isHighPriority"],
        );
      }).toList();

      print(tasks);

      setState(() {
        tasks = tasksModeled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 44,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AddTask();
                },
              ),
            );
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
      backgroundColor: Color(0xFF181818),
      body: SafeArea(
        child: SingleChildScrollView(
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
            
            //displaying the tasks on screen
            if(tasks.isNotEmpty)
              Column(children: [
                Text(tasks[0].taskName, style: TextStyle(color: Colors.white),),
                Text(tasks[0].taskDescription, style: TextStyle(color: Colors.white),),
                Text(tasks[0].isHighPriority.toString(), style: TextStyle(color: Colors.white),),

              ],)
            
            ],
          ),
        ),
      ),
    );
  }
}
