import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/Widgets/custom_checkox_widget.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/screens/high_priority_screen.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  const HighPriorityTasksWidget({
    super.key,
    required this.tasks,
    required this.onTap,
    required this.refresh,
  });

  final List<TaskModel> tasks;
  final Function(bool?, int?) onTap;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "High Priority Tasks",
            style: Theme.of(
              context,
            ).extension<TextStyles>()!.highPriorityTasksTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      tasks.where((e) => e.isHighPriority).toList().length > 4
                      ? 4
                      : tasks.where((e) => e.isHighPriority).toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    final task = tasks.reversed
                        .where((e) => e.isHighPriority)
                        .toList()[index];
                    return Row(
                      children: [
                        CustomCheckBox(
                          value: task.isDone,
                          onChanged: (bool? value) {
                            final index = tasks.indexWhere(
                              (e) => e.id == task.id,
                            );
                            onTap(value, index);
                          },

                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(4),
                          // ),
                        ),
                        Flexible(
                          child: Text(
                            task.taskName,
                            style: task.isDone
                                ? Theme.of(
                                    context,
                                  ).extension<TextStyles>()!.doneTask
                                : Theme.of(
                                    context,
                                  ).extension<TextStyles>()!.undoneTask,

                            maxLines: 1,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                // the icon
                padding: EdgeInsets.only(top: 12.0, left: 12),
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return HighPriorityScreen();
                        },
                      ),
                    );
                    refresh();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      border: BoxBorder.all(color: Color(0xff6E6E6E)),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/arrow-up-right.svg",
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
