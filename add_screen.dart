import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});
  @override
  State<AddScreen> createState() => _AddScreenState();
}
class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(title: const Text('Nova Tarefa')),
    body: 
    Center(
      child: Container(
        color:Colors.black12, 
        height: 650, 
        width:375,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            TextFormField(controller:nameController,
            decoration: 
            InputDecoration(border: OutlineInputBorder(),
            hintText: 'Nome',
            fillColor: Colors.white70,
            filled: true),
            ),
            TextFormField(
            onChanged: (text){
              setState(() {});
            },  
            controller:imageController,
            decoration: 
            InputDecoration(border: OutlineInputBorder(),
            hintText: 'Url Imagem',
            fillColor: Colors.white70,
            filled: true),
            ),
          Container(
            height:100,
            width:72,
            decoration: BoxDecoration(
              color:Colors.blue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width:2, color:Colors.blue)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:Image.network(imageController.text,
                fit:BoxFit.cover),
              )
          ),
         ElevatedButton(
            onPressed: (){
              print(nameController.text);
              print(imageController.text);
            },
            child:Text('Adicionar'),
          ),
          ],
        ),
      ),
    ),
  )
);
}
}
