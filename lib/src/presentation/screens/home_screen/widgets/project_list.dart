import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/src/presentation/bloc/task/task_bloc.dart';
import 'package:task_manager/src/presentation/bloc/task/task_event.dart';
import 'package:task_manager/src/presentation/constants/constat_data.dart';

import '../../../bloc/project_task/project_task_bloc.dart';
import 'project_indicator.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  PageController? _controller;
  int _selectedIndex = 0;
  int _pageIndex = 0;
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(GetTaskById(id: _selectedIndex));
    _controller = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<ProjectTaskBloc, ProjectTaskState>(
        builder: (context, state) {
          if (state is ProjectLoaded) {
            return Column(
              children: [
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.projectTasks.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              _selectedIndex = i;
                              BlocProvider.of<TaskBloc>(context)
                                  .add(const LoadTask(tasks: tasks));
                              BlocProvider.of<TaskBloc>(context)
                                  .add(GetTaskById(id: _selectedIndex));
                              print(_selectedIndex);
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  _selectedIndex == i
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context)
                                          .primaryColorLight
                                          .withOpacity(0.5),
                                  _selectedIndex == i
                                      ? Theme.of(context).primaryColorDark
                                      : Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(0.5)
                                ],
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                      10.0) //                 <--- border radius here
                                  ),
                              color: Colors.white,
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/icons/cart_image.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  10.0) //                 <--- border radius here
                                              ),
                                          color: Theme.of(context)
                                              .primaryColorLight
                                              .withOpacity(0.5),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/icons/ic_project-management.svg",
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        state.projectTasks[i].name!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(state.projectTasks[i].description!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    state.projectTasks[i].crateDate!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                projectIndicator(state, context, _pageIndex)
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
