import 'dart:math';

import 'package:flutter/material.dart';

class AchievedTasksWidget extends StatelessWidget {
  const AchievedTasksWidget({
    super.key,
    required this.totalTasksDone,
    required this.totalTasks,
    required this.donePercentage,
  });

  final int totalTasksDone;
  final int totalTasks;
  final double donePercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF282828),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Achieved Tasks", style: TextStyle(color: Colors.white)),
              Text(
                "$totalTasksDone out of $totalTasks done.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: -pi / 2,
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: CircularProgressIndicator(
                    value: donePercentage,
                    backgroundColor: Color(0xff6D6D6D),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff15B86C),
                    ),
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
              Text(
                "${(donePercentage * 100).toInt()} %",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
