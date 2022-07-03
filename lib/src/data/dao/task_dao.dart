import '../db/database_helper.dart';
import '../models/task_model.dart';

class TaskDao {
  final todoTABLE = "task_tabel";
  final dbProvider = DatabaseProvider.dbProvider;
  Future<int> createTask(Task task) async {
    try {
      print(task.toJson());
      final db = await dbProvider.database;
      var result = db.insert(todoTABLE, task.toJson());
      return result;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<List<Task>> getTasks({String? whereColumn, String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db.query(todoTABLE,
            where: '$whereColumn LIKE ?', whereArgs: ["%$query%"]);
      }
    } else {
      result = await db.query(todoTABLE);
    }
    print(result);

    List<Task> todos = result!.isNotEmpty
        ? result.map((item) => Task.fromJson(item)).toList()
        : [];
    return todos;
  }

  Future<Task?> getTaskByProjectId(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.query(todoTABLE, where: 'project_id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Task.fromJson(result.first) : null;
  }

  //Update Todo record
  Future<int> updateTask(Task task) async {
    final db = await dbProvider.database;

    var result = await db.update(todoTABLE, task.toJson(),
        where: "id = ?", whereArgs: [task.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTask(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTask() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      todoTABLE,
    );

    return result;
  }
}
