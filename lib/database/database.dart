
import 'dart:async';

import 'package:app_cadastro/model/usuario.dart';
import 'package:app_cadastro/repository/usuario_repository.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities:[Usuario])

abstract class BancoDeDadosApp extends FloorDatabase{
  UsuarioRepositoryDAO get usuarioRepositoryDAO;
}