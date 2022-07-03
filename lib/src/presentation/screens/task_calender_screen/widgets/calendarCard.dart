import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_taskBar.dart';

Widget calendarCard(context) {
  return Card(
    color: Colors.white,
    margin: const EdgeInsets.all(0),
    elevation: 6,
    shadowColor: const Color(0xff26725cc1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    ),
    child: Column(
      children: [
        addTaskBar(context),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: DatePicker(
            DateTime.now(),
            height: 80,
            width: 60,
            initialSelectedDate: DateTime.now(),
            dateTextStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textStyle: Theme.of(context).textTheme.bodyText2),
            selectionColor:
                Theme.of(context).primaryColorLight.withOpacity(0.1),
            selectedTextColor: Theme.of(context).primaryColorLight,
          ),
        ),
      ],
    ),
  );
}
