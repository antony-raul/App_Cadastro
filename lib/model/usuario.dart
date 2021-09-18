import 'package:app_cadastro/model/entidade_base.dart';
import 'package:floor/floor.dart';

@entity 
class Usuario extends EntidadeBase{
  final String nome;
  final String numero;
  final String endereco;

  Usuario({int? id, required String created , required this.nome, required this.numero, 
  required this.endereco}) : super(id,created);
}