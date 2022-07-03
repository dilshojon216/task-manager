part of 'project_task_bloc.dart';

abstract class ProjectTaskState extends Equatable {
  const ProjectTaskState();

  @override
  List<Object> get props => [];
}

class ProjectLoading extends ProjectTaskState {}

class ProjectLoaded extends ProjectTaskState {
  final List<Project> projectTasks;

  const ProjectLoaded({this.projectTasks = const <Project>[]});

  @override
  List<Object> get props => [projectTasks];
}
