import 'package:flutter/material.dart';
import 'task.dart';
import 'add_screen.dart';
import 'task_data.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    var taskData = TaskData.of(context);

    return TaskData(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gestão de Tarefas - IFNMG'),
        ),
        body: ListView(
          children: taskData?.taskList ?? [],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(
                  taskContext: context,
                  onSave: (newTask) {
                    setState(() {
                      taskData?.newTask(newTask.nome, newTask.foto);
                    });
                  },
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
