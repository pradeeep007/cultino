// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otherMandiHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OtherMandiHiveAdapter extends TypeAdapter<OtherMandiHive> {
  @override
  final int typeId = 2;

  @override
  OtherMandiHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OtherMandiHive(
      cropId: fields[0] as int,
      district: fields[1] as String,
      districtId: fields[2] as int,
      hindiName: fields[3] as String,
      id: fields[4] as int,
      image: fields[5] as String,
      km: fields[6] as double,
      lastDate: fields[7] as String,
      lat: fields[8] as double,
      lng: fields[9] as double,
      location: fields[10] as String,
      market: fields[11] as String,
      meters: fields[12] as double,
      state: fields[13] as String,
      urlStr: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OtherMandiHive obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.cropId)
      ..writeByte(1)
      ..write(obj.district)
      ..writeByte(2)
      ..write(obj.districtId)
      ..writeByte(3)
      ..write(obj.hindiName)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.km)
      ..writeByte(7)
      ..write(obj.lastDate)
      ..writeByte(8)
      ..write(obj.lat)
      ..writeByte(9)
      ..write(obj.lng)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.market)
      ..writeByte(12)
      ..write(obj.meters)
      ..writeByte(13)
      ..write(obj.state)
      ..writeByte(14)
      ..write(obj.urlStr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherMandiHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
