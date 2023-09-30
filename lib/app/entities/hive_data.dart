import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Dados {
  @HiveField(0)
  double peso;

  @HiveField(1)
  double altura;

  @HiveField(2)
  String resultado;

  Dados(this.peso, this.altura, this.resultado);
}
