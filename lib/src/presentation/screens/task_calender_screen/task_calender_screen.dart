import 'package:flutter/material.dart';
import 'widgets/appBar_widget.dart';
import 'widgets/calendarCard.dart';

class TaskCalenderScreen extends StatefulWidget {
  const TaskCalenderScreen({Key? key}) : super(key: key);

  @override
  State<TaskCalenderScreen> createState() => _TaskCalenderScreenState();
}

class _TaskCalenderScreenState extends State<TaskCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context),
        Column(
          children: [
            calendarCard(context),
          ],
        ),
      ],
    );
  }
}
