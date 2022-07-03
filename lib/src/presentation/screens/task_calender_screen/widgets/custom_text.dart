import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText(context, text, theme) {
  final today = text.toString().split(",");
  final moth = today[0].substring(0, 3);
  print(today[0].substring(0, 3));
  return Text(
    moth + "," + today[1], //"Hello Rohan!",
    style: GoogleFonts.poppins(textStyle: theme, fontSize: 24),
  );
}
