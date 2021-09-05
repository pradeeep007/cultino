// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theKrishiHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class APICacheHiveAdapter extends TypeAdapter<APICacheHive> {
  @override
  final int typeId = 0;

  @override
  APICacheHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return APICacheHive()..data = fields[0] as DataHive;
  }

  @override
  void write(BinaryWriter writer, APICacheHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APICacheHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
