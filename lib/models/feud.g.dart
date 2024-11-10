// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feud.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeudAdapter extends TypeAdapter<Feud> {
  @override
  final int typeId = 0;

  @override
  Feud read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feud(
      name: fields[0] as String,
      foes: fields[1] == null ? const [] : (fields[1] as List).cast<Foe>(),
      skirmishes:
          fields[2] == null ? const [] : (fields[2] as List).cast<Skirmish>(),
    );
  }

  @override
  void write(BinaryWriter writer, Feud obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.foes)
      ..writeByte(2)
      ..write(obj.skirmishes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeudAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
