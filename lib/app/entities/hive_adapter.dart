import 'package:calc_simple/app/entities/hive_data.dart';
import 'package:hive/hive.dart';

class DadosAdapter extends TypeAdapter<Dados> {
  @override
  final int typeId = 0; // Use a unique identifier for each type

  @override
  Dados read(BinaryReader reader) {
    return Dados(
      reader.readDouble(),
      reader.readDouble(),
      reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Dados obj) {
    writer.writeDouble(obj.peso);
    writer.writeDouble(obj.altura);
    writer.writeString(obj.resultado);
  }
}
