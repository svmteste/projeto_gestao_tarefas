import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskAddScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
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
                FirebaseFirestore.instance.collection('tasks').add({
                  'name': nameController.text,
                  'image': imageController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
