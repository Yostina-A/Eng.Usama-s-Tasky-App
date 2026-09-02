import 'package:flutter/material.dart';
import 'package:tasky/models/task_model.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key, required this.tasks, required this.onTap,  this.emptyMessage});

  final List<TaskModel> tasks;
  final Function(bool?, int?) onTap;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Center(
            child: Text(emptyMessage ?? "No Data", style: TextStyle(color: Colors.white)),
          )
        : ListView.builder(
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
                        onChanged: (bool? value) {
                          onTap(value, index);
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
                            if (tasks[index].taskDescription.isNotEmpty)
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
          );
  }
}
