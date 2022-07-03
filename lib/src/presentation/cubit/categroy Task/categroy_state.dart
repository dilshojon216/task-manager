import 'package:equatable/equatable.dart';
import 'package:task_manager/src/data/models/category_task.dart';

class CategroyState extends Equatable {
  final CategoryTask? categoryTask;

  const CategroyState({this.categoryTask});

  @override
  List<Object?> get props => [categoryTask];
}
