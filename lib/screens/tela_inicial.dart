import 'package:app_cadastro/database/database.dart';
import 'package:app_cadastro/model/usuario.dart';
import 'package:app_cadastro/screens/tela_cadastro.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
        onPressed: () async{
          var resultado= await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TelaCadastro(bd: widget.bd);
          }));
          if(resultado){
            setState(() {
              
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Usuario>>(
        future: widget.bd.usuarioRepositoryDAO.getAll(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].nome),
                        subtitle: Text(snapshot.data![index].numero),
                      
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("sem dados cadastrados"),
                );
        },
      ),
    );
  }
}
