import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/src/presentation/routes/main_navigation.dart';

import 'custom_text.dart';
import 'mybutton.dart';

Widget addTaskBar(context) {
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(context, DateFormat.yMMMMd().format(DateTime.now()),
            Theme.of(context).textTheme.bodyText1),
        MyButton(
            label: "+ Add Task",
            onTap: () {
              Navigator.pushNamed(
                  context, MainNavigationRouteNames.createTaskScreen);
            }),
      ],
    ),
  );
}
