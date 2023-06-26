import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTextValue = '';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            onChanged: (newValue) => {
              taskTextValue = newValue
            },
            onEditingComplete: () {
              context.read<TaskData>().addItem(taskTextValue);
              Navigator.pop(context);
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  color: Colors.lightBlueAccent,
                ),
              )
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 2),
            ),
            onPressed: () {
              context.read<TaskData>().addItem(taskTextValue);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
