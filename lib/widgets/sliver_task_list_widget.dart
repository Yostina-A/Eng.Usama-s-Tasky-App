import 'package:flutter/material.dart';
import 'package:tasky/Core/Widgets/custom_checkox_widget.dart';
import 'package:tasky/Core/Widgets/task_item_widget.dart';
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
                return TaskItemWidget(
                task: tasks[index], 
                onChanged: (bool? value) {
                  onTap(value, index);
                });
              },
            ),
          );
  }
}
