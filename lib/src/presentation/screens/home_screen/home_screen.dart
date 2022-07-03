import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/column_text.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/project_list.dart';
import 'widgets/task_list.dart';
import 'widgets/task_type_list.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({Key? key}) : super(key: key);

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            columnText(context, "Hello Rohan!", "Have a nice day."),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TaskTypeList(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const ProjectList(),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 5.0),
              child: Text(
                "Progress",
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const TaskList(),
          ],
        ),
      ),
    );
  }
}
