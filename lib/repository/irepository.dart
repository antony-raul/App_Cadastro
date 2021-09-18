import 'package:app_cadastro/model/entidade_base.dart';
import 'package:floor/floor.dart';

abstract class IrepositoryDAO<Model extends EntidadeBase >{
  @insert 
  Future<int> insertItem(Model item);

  @update
  Future<int> updateItem(Model item);

  @delete 
  Future<int> deleteItem(Model item);
}