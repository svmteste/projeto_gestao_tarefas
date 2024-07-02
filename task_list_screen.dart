import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_add_screen.dart';
import 'task_edit_screen.dart';

class TaskListScreen extends StatelessWidget {
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),


      body: StreamBuilder(
        stream: tasks.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((task) {
              return ListTile(
                title: Text(task['name']),
                subtitle: Text(task['image']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    tasks.doc(task.id).delete();
                  },
                ),
                
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskEditScreen(task: task),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAddScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
