part of 'project_task_bloc.dart';

abstract class ProjectTaskEvent extends Equatable {
  const ProjectTaskEvent();

  @override
  List<Object> get props => [];
}

class LoadProject extends ProjectTaskEvent {
  final List<Project> projects;
  const LoadProject({this.projects = const <Project>[]});

  @override
  List<Object> get props => [projects];
}

class AddProject extends ProjectTaskEvent {
  final Project project;
  const AddProject({required this.project});

  @override
  List<Object> get props => [project];
}

class UpdateProject extends ProjectTaskEvent {
  final Project project;
  const UpdateProject({required this.project});

  @override
  List<Object> get props => [project];
}

class DeleteProject extends ProjectTaskEvent {
  final Project project;
  const DeleteProject({required this.project});

  @override
  List<Object> get props => [project];
}
