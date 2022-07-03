import 'package:equatable/equatable.dart';

import 'package:task_manager/src/presentation/cubit/taskType/task_type_items.dart';

class Task extends Equatable {
  final int? id;
  final String? taskName;
  final String? taskDescription;
  final String? taskStart;
  final String? taskEnd;
  final String? taskStatus;
  final String? taskCreated;
  final String? projectId;
  final String? taskCategory;
  const Task({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.taskStart,
    required this.taskEnd,
    required this.taskStatus,
    required this.taskCreated,
    required this.projectId,
    required this.taskCategory,
  });

  Task.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'],
        taskName = json['taskName'].toString(),
        taskDescription = json['taskDescription'].toString(),
        taskStart = json['taskStart'].toString(),
        taskEnd = json['taskEnd'].toString(),
        taskStatus = json['taskStatus'].toString(),
        taskCreated = json['taskCreated'].toString(),
        projectId = json['projectId'].toString(),
        taskCategory = json['taskCategory'].toString();

  Map<String, dynamic> toJson() => {
        'taskName': taskName,
        'taskDescription': taskDescription,
        'taskStart': taskStart,
        'taskEnd': taskEnd,
        'taskStatus': taskStatus,
        'taskCreated': taskCreated,
        'projectId': projectId,
        'taskCategory': taskCategory
      };

  @override
  List<Object?> get props => [
        id,
        taskName,
        taskDescription,
        taskStart,
        taskEnd,
        taskStatus,
        taskCreated,
        projectId,
        taskCategory
      ];
}
