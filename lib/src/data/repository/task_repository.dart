import 'package:task_manager/src/data/dao/task_dao.dart';

import '../models/task_model.dart';

class TaskRepository {
  final taskDao = TaskDao();
  Future<List<Task>> getAllTask({String? query}) =>
      taskDao.getTasks(query: query);

  Future getTaskById(int id) => taskDao.getTaskByProjectId(id);

  Future insertTask(Task task) => taskDao.createTask(task);

  Future updateTask(Task task) => taskDao.updateTask(task);

  Future deleteTask(Task task) => taskDao.deleteTask(task.id!);

  Future deleteAllTodos() => taskDao.deleteAllTask();
}
