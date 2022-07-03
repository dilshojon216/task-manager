import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:task_manager/src/presentation/bloc/task/task_bloc.dart';
import 'package:task_manager/src/presentation/cubit/taskType/task_type_cubit.dart';
import 'package:task_manager/src/presentation/routes/main_navigation.dart';
import 'package:task_manager/src/presentation/theme/app_theme.dart';
import 'src/presentation/bloc/project_task/project_task_bloc.dart';
import 'src/presentation/bloc/task/task_event.dart';
import 'src/presentation/constants/constat_data.dart';
import 'src/presentation/cubit/categroy Task/category_cubit.dart';
import 'src/presentation/cubit/navigation/navigation_cubit.dart';

void main() {
  var log = Logger();
  runZonedGuarded(() {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    );
  }, (error, stacktrace) {
    log.e(error);
    log.v(stacktrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return Sizer(
              builder: (context, constraints, orientation) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<NavigationCubit>(
                      create: (context) => NavigationCubit(),
                    ),
                    BlocProvider<TaskTypeCubit>(
                      create: (context) => TaskTypeCubit(),
                    ),
                    BlocProvider<ProjectTaskBloc>(
                      create: (context) => ProjectTaskBloc()
                        ..add(
                          const LoadProject(
                            projects: projects,
                          ),
                        ),
                    ),
                    BlocProvider<TaskBloc>(
                      create: (context) => TaskBloc()
                        ..add(
                          const LoadTask(),
                        ),
                    ),
                    BlocProvider<CategroyCubit>(
                      create: (context) => CategroyCubit(),
                    ),
                  ],
                  child: MaterialApp(
                    title: 'Task Manager',
                    theme: AppTheme.lightTeme,
                    darkTheme: AppTheme.darkTheme,
                    debugShowCheckedModeBanner: false,
                    themeMode: ThemeMode.light,
                    initialRoute: MainNavigationRouteNames.splashScreen,
                    routes: MainNavigationRoute.routes,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
