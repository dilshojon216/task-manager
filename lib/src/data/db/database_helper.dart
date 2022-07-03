import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/project_model.dart';
import '../models/task_model.dart';

final todoTABLE = [Task, Project];

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"task_manager.db is our database instance name
    String path = join(documentsDirectory.path, "task_manager.db");

    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  final String tableTodo = 'task_tabel';
  final String colId = 'id';
  final String colTaskName = 'taskName';
  final String colDescription = 'taskDescription';
  final String colDate = 'taskCreated';
  final String colStartTime = 'taskStart';
  final String colEndTime = 'taskEnd';
  final String colType = 'taskStatus';
  final String colProject = 'projectId';
  final String colCatergory = 'taskCategory';
  void initDB(Database database, int version) async {
    await database.execute(
      "CREATE TABLE $tableTodo ("
      "id INTEGER PRIMARY KEY, "
      "$colTaskName TEXT ,"
      "$colDescription TEXT,"
      "$colDate TEXT,"
      "$colStartTime TEXT,"
      "$colEndTime TEXT,"
      "$colType TEXT,"
      "$colProject TEXT,"
      "$colCatergory TEXT"
      ")",
    );
  }
}
