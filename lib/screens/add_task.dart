import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/screens/home_screen.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  /// TODO: DISPOSE THESE CONTROLLERS

  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController taskDescriptionController =
      TextEditingController();

  bool isHighPriority = true;

  List<Map<String, dynamic>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        title: Text("New Task"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Name",
                          style: TextStyle(
                            color: Color(0xFFFFFCFC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: taskNameController,

                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter Task Name";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Color(0xFFFFFCFC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "e.g. Prepare food",
                            hintStyle: TextStyle(
                              color: Color(0xFF6D6D6D),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Color(0xFF282828),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: 20),

                        Text(
                          "Task Description",
                          style: TextStyle(
                            color: Color(0xFFFFFCFC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: taskDescriptionController,
                          maxLines: 5,
                          // validator: (String? value) {
                          //   if (value == null || value.trim().isEmpty) {
                          //     return "Please enter Task Description";
                          //   }
                          //   return null;
                          // },
                          style: TextStyle(
                            color: Color(0xFFFFFCFC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "e.g. Prepare food",
                            hintStyle: TextStyle(
                              color: Color(0xFF6D6D6D),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Color(0xFF282828),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Colors.white,
                        ),

                        SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "High Priority?",
                              style: TextStyle(
                                color: Color(0xFFFFFCFC),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Switch(
                              value: isHighPriority,
                              onChanged: (bool value) {
                                setState(() {
                                  isHighPriority = value;
                                });
                              },
                              activeTrackColor: Color(0xFF15B86C),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () async {
                    if (_key.currentState?.validate() ?? false) {
                      final TaskModel newTask = TaskModel(
                        taskName: taskNameController.text,
                        taskDescription: taskDescriptionController.text,
                        isHighPriority: isHighPriority,
                      );
                      
                      final pref = await SharedPreferences.getInstance();
                      final taskListJson = pref.getString("tasks");
                      List<dynamic> taskListMaped = [];
                      if(taskListJson != null) {
                          taskListMaped = jsonDecode(taskListJson);
                      }
                      //using toJson() of the TaskModel method to so that we can add to the 
                      //dynamic list of tasks
                      taskListMaped.add(newTask.toJson()); 
                      final taskListEncoded = jsonEncode(taskListMaped);
                      await pref.setString("tasks", taskListEncoded);
                      
                      
                    }
                    Navigator.of(context).pop();
                  //     context, 
                  //     MaterialPageRoute(
                  //       builder: (BuildContext context){
                  //         return HomeScreen();
                  //   }));
                   },
                  label: Text("Add Task"),
                  icon: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF15B86C),
                    foregroundColor: Color(0xFFFFFCFC),
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
