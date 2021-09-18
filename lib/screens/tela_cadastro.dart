import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de usuario"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _Form(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _Form() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome:'),
              maxLength: 40,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Número para contato:'),
              keyboardType: TextInputType.phone,
              maxLength: 15,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Escreva o endereço:'),
              maxLength: 40,
            ),
          ],
        ),
      ),
    );
  }

  _sendForm() {}
}
