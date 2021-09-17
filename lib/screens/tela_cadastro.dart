import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de usuario"),
      ),

      body: Column(
        children: <Widget>[
          _Form(),
        ],
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
            new TextFormField(
        decoration: new InputDecoration(hintText: 'Nome:'),
        maxLength: 40,
            ),

            new TextFormField(
                decoration: new InputDecoration(hintText: 'Número para contato:'),
                keyboardType: TextInputType.phone,
                maxLength: 15,
                ),
            new TextFormField(
              decoration: new InputDecoration(hintText: 'Escreva o endereço:'),
              maxLength: 40,
            ),

            new RaisedButton(
              onPressed: _sendForm,
                color: Colors.deepOrange,
              child: new Text('Salvar'),
            )

          ],
        ),
      ),
    );


  }

  _sendForm() {

  }

}