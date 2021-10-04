import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/notifiers/task_data.dart';

class AddTasksScreen extends StatelessWidget {
  String taskTitle = "Bye";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return // Rounded corners at the top
        Container(
      color: Color(0xff757575),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Theme(
                data: theme.copyWith(primaryColor: Colors.lightBlueAccent),
                child: TextField(
                  onChanged: (value) {
                    taskTitle = value;
                  },
                  autofocus: true,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelStyle: theme.textTheme.caption!
                        .copyWith(color: theme.primaryColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 5.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 5.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              MaterialButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addNewTask(Task(name: taskTitle, isDone: false));
                  Navigator.pop(context);
                },
                minWidth: double.infinity,
                height: 50.0,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
