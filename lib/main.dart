import 'package:app_cadastro/screens/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Cadastro',
      theme: ThemeData(
        
        primarySwatch: Colors.deepOrange,
      ),
      home: const TelaInicial(),
    );
  }
}