// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skirmish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SkirmishAdapter extends TypeAdapter<Skirmish> {
  @override
  final int typeId = 2;

  @override
  Skirmish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Skirmish(
      results: (fields[1] as Map).cast<Foe, int>(),
      date: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Skirmish obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkirmishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
