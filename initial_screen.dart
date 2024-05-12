import 'package:flutter/material.dart';
import 'package:projeto_tarefas/task.dart';

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
                'https://ih1.redbubble.net/image.4598241582.6557/st,small,507x507-pad,600x600,f8f8f8.jpg'),
            Task('Aprender JavaScript',
                'https://ih1.redbubble.net/image.815350031.4911/st,small,507x507-pad,600x600,f8f8f8.u1.jpg'),
            Task('Aprender Python',
                'https://qph.cf2.quoracdn.net/main-qimg-28cadbd02699c25a88e5c78d73c7babc'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('botao clicado');
          },
          child: Icon(Icons.add),
        ),
      );
  }
}