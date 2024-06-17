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
                drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Adicionar Tarefa'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
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
              ),
              // Adicione mais itens de menu aqui
            ],
          ),
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
