import 'package:flutter/material.dart';
import 'package:tasky/Core/Widgets/custom_checkox_widget.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/models/task_model.dart';

class SliverTaskListWidget extends StatelessWidget {
  const SliverTaskListWidget({
    super.key,
    required this.tasks,
    required this.onTap,
    this.emptyMessage,
  });

  final List<TaskModel> tasks;
  final Function(bool?, int?) onTap;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? SliverToBoxAdapter(
            child: Center(
              child: Text(
                emptyMessage ?? "No Data",
                style: Theme.of(context).extension<TextStyles>()!.bodyOne,
              ),
            ),
          )
        : SliverPadding(
            padding: EdgeInsets.only(bottom: 60),
            sliver: SliverList.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsetsGeometry.only(top: 8),
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // the row of each task components
                    child: Row(
                      children: [
                        CustomCheckBox(
                          value: tasks[index].isDone,
                          onChanged: (bool? value) {
                            onTap(value, index);
                          },
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //task name
                              Text(
                                tasks[index].taskName,
                                style: tasks[index].isDone
                                    ? Theme.of(
                                        context,
                                      ).extension<TextStyles>()!.doneTask
                                    : Theme.of(
                                        context,
                                      ).extension<TextStyles>()!.undoneTask,
                                maxLines: 1,
                              ),
                              //task decription
                              if (tasks[index].taskDescription.isNotEmpty)
                                Text(
                                  tasks[index].taskDescription,
                                  style: tasks[index].isDone
                                      ? Theme.of(
                                          context,
                                        ).extension<TextStyles>()!.doneTask
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
          );
  }
}
