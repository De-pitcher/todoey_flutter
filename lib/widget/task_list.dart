import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'list_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTittle: task.name,
            isChecked: task.isDone,
            checkBoxCallBack: (bool? checkBoxState) {
              taskData.updateTask(task);
            },
            onLongPressCallBack: () {
              taskData.removeTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
