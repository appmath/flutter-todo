import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/notifiers/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var task = taskData.tasks[index];
            return TaskTile(
              task: task,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Delete task'),
                  content: Text('Delete ${task.name}?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => {
                        Provider.of<TaskData>(context, listen: false)
                            .removeTask(task),
                        Navigator.pop(context, 'OK')
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
