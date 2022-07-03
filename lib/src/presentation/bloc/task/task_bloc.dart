import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/bloc/task/task_event.dart';
import 'package:task_manager/src/presentation/bloc/task/task_state.dart';

import '../../../data/models/task_model.dart';
import '../../../data/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final _todoRepository = TaskRepository();

  TaskBloc() : super(TaskLoading()) {
    on<LoadTask>(_taskLoaded);
    on<GetTaskById>(_getTaskById);
    on<AddTask>(_addTask);
  }

  void _addTask(AddTask event, Emitter<TaskState> emit) async {
    print("event");
    final state = this.state;
    print(state);
    if (state is TaskLoaded) {
      print("event1");

      var restult = await _todoRepository.insertTask(event.task);
      if (restult is int) {
        var taskList = await _todoRepository.getAllTask();
        emit(TaskLoaded(projectTasks: taskList));
      } else {
        emit(TaskError(message: restult.toString()));
        print(restult.toString());
      }
    }
  }

  void _taskLoaded(LoadTask event, Emitter<TaskState> emit) async {
    try {
      var taskList = await _todoRepository.getAllTask();
      emit(TaskLoaded(projectTasks: taskList));
      print(taskList);
    } catch (e) {
      print(e.toString() + "sds");
    }
  }

  void _getTaskById(GetTaskById event, Emitter<TaskState> emit) {
    try {
      final state = this.state;
      if (state is TaskLoaded) {
        List<Task> taskList = state.projectTasks;
        List<Task> findTask =
            taskList.where((task) => task.projectId == event.id).toList();
        emit(TaskLoaded(projectTasks: findTask));
        print(findTask);
      }
    } catch (e) {
      print(e);
    }
  }
}
