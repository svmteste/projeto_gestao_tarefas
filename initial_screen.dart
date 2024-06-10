// initial_screen.dart

import 'package:flutter/material.dart';
import 'task.dart';
import 'add_screen.dart';
import 'edit_screen.dart';
import 'task_data.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    final taskData = TaskData.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Tarefas - IFNMG'),
      ),
      body: ListView(
        children: taskData?.taskList.map((task) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(task: task, taskContext: context),
                ),
              );
            },
            child: task,
          );
        }).toList() ?? [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(taskContext: context),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
