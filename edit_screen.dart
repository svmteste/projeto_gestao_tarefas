import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskEditScreen extends StatelessWidget {
  final DocumentSnapshot task;
  final TextEditingController nameController;
  final TextEditingController imageController;

  TaskEditScreen({required this.task})
      : nameController = TextEditingController(text: task['name']),
        imageController = TextEditingController(text: task['image']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
                  'name': nameController.text,
                  'image': imageController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
