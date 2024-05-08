import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listbutton/listbut.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Buttons'),
        ),
        body: ListButton(),
      ),
    );
  }
}

