import 'package:app_cadastro/model/usuario.dart';
import 'package:app_cadastro/repository/irepository.dart';
import 'package:floor/floor.dart';

@dao
abstract class UsuarioRepositoryDAO extends IrepositoryDAO<Usuario>{
  @Query('SELECT *  Usuario WHERE id = :id')
  Future<Usuario?> getById(int id);

  @Query('SELECT * FROM Usuario')
  Future<List<Usuario>> getAll();
}