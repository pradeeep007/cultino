// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theDataHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataHiveAdapter extends TypeAdapter<DataHive> {
  @override
  final int typeId = 1;

  @override
  DataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataHive(
      otherMandi: (fields[0] as List).cast<OtherMandiHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.otherMandi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
