// task.dart

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  String nome;
  String foto;

  Task(this.nome, this.foto, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  // Definir o método updateTask
  void updateTask(String nome, String foto) {
    setState(() {
      widget.nome = nome;
      widget.foto = foto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white10,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          )),
                      Text(
                        widget.nome,
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                          print(nivel);
                        },
                        child: Icon(Icons.arrow_drop_up),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.amber,
                        color: Colors.white,
                        value: nivel / 10,
                      ),
                      width: 200,
                    ),
                    Text(
                      'Nivel $nivel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
