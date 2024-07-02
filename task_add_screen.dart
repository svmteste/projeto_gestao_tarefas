import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskAddScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefas'),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Tarefa'),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Gerando um ID personalizado para o documento
                String customID = 'Tarefa_'+ DateTime.now().millisecondsSinceEpoch.toString();
                
                FirebaseFirestore.instance.collection('tasks').doc(customID).set({
                  'name': nameController.text,
                  'image': imageController.text,
                }).then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  print('Erro ao adicionar tarefa: $error');
                });
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
//             ElevatedButton(
//               onPressed: () {
//                 FirebaseFirestore.instance.collection('tasks').add({
//                   'name': nameController.text,
//                   'image': imageController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Adicionar Tarefa'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
