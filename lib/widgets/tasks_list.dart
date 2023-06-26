import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<TaskData>().taskCount,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: context.watch<TaskData>().tasks[index].name,
          isChecked: context.watch<TaskData>().tasks[index].isDone,
          checkboxCallback: (checkboxState) {
            context.read<TaskData>().checkItem(context.read<TaskData>().tasks[index]);
          },
          longPressFunc: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Delete this task?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('No, Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<TaskData>().deleteItem(context.read<TaskData>().tasks[index]);
                    Navigator.pop(context);
                  },
                  child: Text('Yes, Delete'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
