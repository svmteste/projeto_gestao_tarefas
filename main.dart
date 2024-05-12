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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;

  const Task(this.nome, this.foto, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    //nivel antes estava aqui
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
