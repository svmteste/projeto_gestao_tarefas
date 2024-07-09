// Based on https://dartpad.dev/?id=d57c6c898dabb8c6fb41018588b8cf73
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'task_list_screen.dart';

const Color darkBlue = Color.fromARGB(0, 47, 18, 43);

const messageLimit = 30;


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: const FirebaseOptions(
  apiKey: 
  authDomain:
  projectId: 
  storageBucket: 
  messagingSenderId: 
  appId: 
  measurementId: ));
 runApp(MyApp());
 FirebaseFirestore firestore = FirebaseFirestore.instance;
 firestore.collection('Teste').doc('Teste_aula_mobile').set({'nome': 'Suzana Zapp'});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD - Gestão Tarefas IFNMG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

