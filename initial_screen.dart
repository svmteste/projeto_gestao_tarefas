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
    return TaskData(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Gestão de Tarefas - IFNMG'),
            //backgroundColor: Colors.blue,
          ),
          body: ListView(
            children: TaskData.of(context)?.taskList ?? []
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder:(context)=>AddScreen(taskContext: context,),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
    );
  }
}
