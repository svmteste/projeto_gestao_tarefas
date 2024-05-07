import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gestão de Tarefas - IFNMG'),
          //backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Task('Tarefa1'),
            Task('Tarefa2 a maior de todas elas'),
            Task('Tarefa3'),
            Task('Tarefa4'),
            Task('Tarefa5'),
            Task('Tarefa6'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('botao clicado');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;

  const Task(this.nome, {Key? key}) : super(key: key);

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
                  ),
                  Text(
                    nome,
                    style: TextStyle(
                        fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_drop_up),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
