import 'package:floor/floor.dart';

class EntidadeBase{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  
  final String created;

  EntidadeBase(this.id, this.created);
}