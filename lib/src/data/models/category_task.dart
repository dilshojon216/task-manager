import 'package:equatable/equatable.dart';

class CategoryTask extends Equatable {
  final int id;
  final String name;
  bool? isDone;

  CategoryTask({required this.id, required this.name, this.isDone});

  @override
  List<Object?> get props => [id, name, isDone];
}

List<CategoryTask> getCategroy = [
  CategoryTask(id: 0, name: 'Design', isDone: false),
  CategoryTask(id: 1, name: 'Meeting', isDone: false),
  CategoryTask(id: 2, name: 'Coding', isDone: false),
  CategoryTask(id: 3, name: 'BDE', isDone: false),
  CategoryTask(id: 4, name: 'Testing', isDone: false),
  CategoryTask(id: 5, name: 'Quick call', isDone: false),
];
