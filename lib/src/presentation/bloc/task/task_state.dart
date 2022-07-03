import 'package:equatable/equatable.dart';
import 'package:task_manager/src/data/models/task_model.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> projectTasks;

  const TaskLoaded({this.projectTasks = const <Task>[]});

  @override
  List<Object> get props => [projectTasks];
}

class TaskError extends TaskState {
  final String? message;

  const TaskError({this.message});

  @override
  List<Object> get props => [message!];
}
