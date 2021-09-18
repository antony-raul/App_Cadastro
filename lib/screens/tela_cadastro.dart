
import 'package:app_cadastro/database/database.dart';
import 'package:app_cadastro/model/usuario.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  TelaCadastro({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  final _nomeContorller = TextEditingController(text: '');
  final _numeroContorller = TextEditingController(text: '');  
  final _enderecoContorller = TextEditingController(text: '');    

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
          _form(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendForm();
          Navigator.pop(context,true);
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _form() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nomeContorller,
              decoration: const InputDecoration(hintText: 'Nome:'),
              maxLength: 40,
            ),
            TextFormField(
              controller: _numeroContorller,
              decoration:
                  const InputDecoration(hintText: 'Número para contato:'),
              keyboardType: TextInputType.phone,
              maxLength: 15,
            ),
            TextFormField(
              controller: _enderecoContorller,
              decoration:
                  const InputDecoration(hintText: 'Escreva o endereço:'),
              maxLength: 40,
            ),
          ],
        ),
      ),
    );
  }

  _sendForm() {
    if(_nomeContorller.text.isNotEmpty && _numeroContorller.text.isNotEmpty
    && _enderecoContorller.text.isNotEmpty){
      bd.usuarioRepositoryDAO.insertItem( Usuario(
        nome: _nomeContorller.text,
        numero: _numeroContorller.text,
        endereco: _enderecoContorller.text,
        created: DateTime.now().toUtc().toString()
      ));
      
    }

  }
}
