import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/project_model.dart';

part 'project_task_event.dart';
part 'project_task_state.dart';

class ProjectTaskBloc extends Bloc<ProjectTaskEvent, ProjectTaskState> {
  ProjectTaskBloc() : super(ProjectLoading()) {
    on<LoadProject>(_onLoadProject);
    on<AddProject>(_onAddProject);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
  }
  void _onLoadProject(LoadProject event, Emitter<ProjectTaskState> emit) {
    emit(ProjectLoaded(projectTasks: event.projects));
  }

  void _onAddProject(AddProject event, Emitter<ProjectTaskState> emit) {
    final state = this.state;
    if (state is ProjectLoaded) {
      emit(ProjectLoaded(projectTasks: state.projectTasks..add(event.project)));
    }
  }

  void _onUpdateProject(UpdateProject event, Emitter<ProjectTaskState> emit) {
    final state = this.state;
    if (state is ProjectLoaded) {
      // emit(ProjectLoaded(
      //     projectTasks: state.projectTasks..replace(event.project)));
    }
  }

  void _onDeleteProject(DeleteProject event, Emitter<ProjectTaskState> emit) {
    final state = this.state;
    // if (state is ProjectLoaded) {
    //   List<Project> project=state.projectTasks.wher
    // }
  }
}
