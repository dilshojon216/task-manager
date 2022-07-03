import 'package:task_manager/src/data/models/project_model.dart';

import '../../data/models/task_model.dart';
import '../cubit/taskType/task_type_items.dart';

const List<Task> tasks = [
  Task(
    id: 1,
    taskName: "Design Changes",
    taskDescription: "Loranaofasdfa  asdasd",
    taskStart: "1",
    taskEnd: "2",
    taskStatus: ".MyTask",
    taskCreated: null,
    projectId: "0",
    taskCategory: "",
  ),
  Task(
    id: 2,
    taskName: "Design Changes",
    taskDescription: "Loranaofasdfa  asdasd",
    taskStart: "2022 02 01",
    taskEnd: "2",
    taskStatus: ".inProgress",
    taskCreated: null,
    projectId: "1",
    taskCategory: "",
  ),
  Task(
      id: 3,
      taskName: "Design Changes",
      taskDescription: "Loranaofasdfa  asdasd",
      taskStart: "2022 02 01",
      taskEnd: "2",
      taskStatus: ".inProgress",
      taskCreated: null,
      taskCategory: "",
      projectId: "2"),
  Task(
      id: 4,
      taskName: "Design Changes",
      taskDescription: "Loranaofasdfa  asdasd",
      taskStart: "2022 02 01",
      taskEnd: "2",
      taskStatus: "inProgress",
      taskCreated: null,
      taskCategory: "",
      projectId: "2"),
];
const List<Project> projects = [
  Project(
    id: 0,
    name: "Project 1",
    description: "Front-End Development",
    crateDate: "October 20, 2020",
  ),
  Project(
    id: 1,
    name: "Project 2",
    description: "Back-End Development",
    crateDate: "October 19, 2020",
  ),
  Project(
    id: 2,
    name: "Project 3",
    description: "Mobile Development",
    crateDate: "October 22, 2020",
  ),
];
