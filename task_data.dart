import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends InheritedWidget {
  TaskData({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [ 
    Task('Aprender Flutter',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGSOWo9qmnUodB3WIJ34rwlfNXOLoch7jVflrIppe92UAhGM9hjzbYDTtWHZj_y-Wa1BA&usqp=CAU'),
    Task('Aprender JavaScript',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZ0Gy068hsbTG6MVcSBE11zBx4gRtcPgk3p5kdZnrbg&s'),
    Task('Aprender Python',
                'https://qph.cf2.quoracdn.net/main-qimg-28cadbd02699c25a88e5c78d73c7babc'),
  ];

  void newTask(String name, String image) {
    taskList.add(Task(name, image));
  }

  void updateTask(Task task, String name, String image) {
    int index = taskList.indexOf(task);
    if (index != -1) {
      taskList[index].nome = name;
      taskList[index].foto = image;
    }
  }

  static TaskData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskData>();
  }

  @override
  bool updateShouldNotify(TaskData oldWidget) {
    return oldWidget.taskList != taskList;
  }
}
