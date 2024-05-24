import 'package:flutter/material.dart';
import 'task.dart';
import 'add_screen.dart';
class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestão de Tarefas - IFNMG'),
          //backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGSOWo9qmnUodB3WIJ34rwlfNXOLoch7jVflrIppe92UAhGM9hjzbYDTtWHZj_y-Wa1BA&usqp=CAU'),
            Task('Aprender JavaScript',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZ0Gy068hsbTG6MVcSBE11zBx4gRtcPgk3p5kdZnrbg&s'),
            Task('Aprender Python',
                'https://qph.cf2.quoracdn.net/main-qimg-28cadbd02699c25a88e5c78d73c7babc'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AddScreen();
            print("AA");
          },
          child: Icon(Icons.add),
        ),
      );
  }
}
