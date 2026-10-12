import 'package:flutter/material.dart';
import 'package:tasky/Core/Widgets/custom_checkox_widget.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/Core/theme/theme_controller.dart';
import 'package:tasky/models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.task,
    required this.onChanged,
  });

  final TaskModel task;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(top: 8),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ThemeController.isDark()
                ? Colors.transparent
                : Color(0xffD1DAD6),
          ),
        ),
        // the row of each task components
        child: Row(
          children: [
            CustomCheckBox(
              value: task.isDone,
              onChanged: (bool? value) => onChanged(value),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //task name
                  Text(
                    task.taskName,
                    style: task.isDone
                        ? Theme.of(context).extension<TextStyles>()!.doneTask
                        : Theme.of(context).extension<TextStyles>()!.undoneTask,
                    maxLines: 1,
                  ),
                  //task decription
                  if (task.taskDescription.isNotEmpty)
                    Text(
                      task.taskDescription,
                      style: task.isDone
                          ? Theme.of(context).extension<TextStyles>()!.doneTask
                          : Theme.of(
                              context,
                            ).extension<TextStyles>()!.secondaryText2,
                      maxLines: 1,
                    ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: ThemeController.isDark()
                  ? (task.isDone ? Color(0xFFA0A0A0) : Color(0xFFC6C6C6))
                  : (task.isDone ? Color(0xFF6A6A6A) : Color(0xFF3A4640)),
            ),
          ],
        ),
      ),
    );
  }
}
