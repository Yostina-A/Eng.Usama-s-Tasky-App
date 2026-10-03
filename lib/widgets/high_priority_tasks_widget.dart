import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        color: Color(0xFF282828),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "High Priority Tasks",
            style: TextStyle(color: Color(0xff15B86C)),
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
                        Checkbox(
                          value: task.isDone,
                          onChanged: (bool? value) {
                            final index = tasks.indexWhere(
                              (e) => e.id == task.id,
                            );
                            onTap(value, index);
                          },
                          activeColor: Color(0xFF15B86C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            task.taskName,
                            style: TextStyle(
                              color: task.isDone
                                  ? Color(0xFFA0A0A0)
                                  : Color(0xFFFFFCFC),
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Color(0xFFA0A0A0),
                              overflow: TextOverflow.ellipsis,
                            ),
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
                      color: Color(0xFF282828),
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

  //         Column(// the list of tasks
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "High Priority Tasks",
  //               style: TextStyle(color: Color(0xff15B86C)),
  //             ),
  //             SizedBox(height: 8),
  //             ...tasks.reversed.where((e) => e.isHighPriority).take(4).map((
  //               e,
  //             ) {
  //               return Row(
  //                 children: [
  //                   Checkbox(
  //                     value: e.isDone,
  //                     onChanged: (bool? value) {
  //                       final index = tasks.indexWhere((e) => e.id == e.id);
  //                       onTap(value, index);
  //                     },
  //                     activeColor: Color(0xFF15B86C),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(4),
  //                     ),
  //                   ),
  //                   Flexible(
  //                     child: Text(
  //                       e.taskName,
  //                       style: TextStyle(
  //                         color: e.isDone
  //                             ? Color(0xFFA0A0A0)
  //                             : Color(0xFFFFFCFC),
  //                         decoration: e.isDone
  //                             ? TextDecoration.lineThrough
  //                             : TextDecoration.none,
  //                         decorationColor: Color(0xFFA0A0A0),
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                       maxLines: 1,
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             }),
  //           ],
  //         ),
  //       ),
  //       Padding( // the icon
  //         padding: EdgeInsets.only(top: 12.0 , left: 12),
  //         child: GestureDetector(
  //           onTap: () async{
  //             await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
  //               return HighPriorityScreen();
  //             }));
  //             refresh();
  //           },
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             height: 48,
  //             width: 48,
  //             decoration: BoxDecoration(
  //               color: Color(0xFF282828),
  //               border: BoxBorder.all(color: Color(0xff6E6E6E)),
  //               shape: BoxShape.circle,
  //             ),
  //             child: SvgPicture.asset(
  //               "assets/images/arrow-up-right.svg",
  //               height: 10,
  //               width: 10,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
