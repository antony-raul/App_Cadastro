import 'package:app_cadastro/screens/tela_cadastro.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xF1212121),
      appBar: AppBar(
        title: const Text("Pessoas cadastradas"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TelaCadastro();
          }));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
