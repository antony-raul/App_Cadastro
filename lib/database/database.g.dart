// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBancoDeDadosApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder databaseBuilder(String name) =>
      _$BancoDeDadosAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder inMemoryDatabaseBuilder() =>
      _$BancoDeDadosAppBuilder(null);
}

class _$BancoDeDadosAppBuilder {
  _$BancoDeDadosAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BancoDeDadosAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BancoDeDadosAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BancoDeDadosApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BancoDeDadosApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BancoDeDadosApp extends BancoDeDadosApp {
  _$BancoDeDadosApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsuarioRepositoryDAO? _usuarioRepositoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Usuario` (`nome` TEXT NOT NULL, `numero` TEXT NOT NULL, `endereco` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `created` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsuarioRepositoryDAO get usuarioRepositoryDAO {
    return _usuarioRepositoryDAOInstance ??=
        _$UsuarioRepositoryDAO(database, changeListener);
  }
}

class _$UsuarioRepositoryDAO extends UsuarioRepositoryDAO {
  _$UsuarioRepositoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _usuarioInsertionAdapter = InsertionAdapter(
            database,
            'Usuario',
            (Usuario item) => <String, Object?>{
                  'nome': item.nome,
                  'numero': item.numero,
                  'endereco': item.endereco,
                  'id': item.id,
                  'created': item.created
                }),
        _usuarioUpdateAdapter = UpdateAdapter(
            database,
            'Usuario',
            ['id'],
            (Usuario item) => <String, Object?>{
                  'nome': item.nome,
                  'numero': item.numero,
                  'endereco': item.endereco,
                  'id': item.id,
                  'created': item.created
                }),
        _usuarioDeletionAdapter = DeletionAdapter(
            database,
            'Usuario',
            ['id'],
            (Usuario item) => <String, Object?>{
                  'nome': item.nome,
                  'numero': item.numero,
                  'endereco': item.endereco,
                  'id': item.id,
                  'created': item.created
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Usuario> _usuarioInsertionAdapter;

  final UpdateAdapter<Usuario> _usuarioUpdateAdapter;

  final DeletionAdapter<Usuario> _usuarioDeletionAdapter;

  @override
  Future<Usuario?> getById(int id) async {
    return _queryAdapter.query('SELECT *  Usuario WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Usuario(
            id: row['id'] as int?,
            created: row['created'] as String,
            nome: row['nome'] as String,
            numero: row['numero'] as String,
            endereco: row['endereco'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Usuario>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Usuario',
        mapper: (Map<String, Object?> row) => Usuario(
            id: row['id'] as int?,
            created: row['created'] as String,
            nome: row['nome'] as String,
            numero: row['numero'] as String,
            endereco: row['endereco'] as String));
  }

  @override
  Future<int> insertItem(Usuario item) {
    return _usuarioInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Usuario item) {
    return _usuarioUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Usuario item) {
    return _usuarioDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
