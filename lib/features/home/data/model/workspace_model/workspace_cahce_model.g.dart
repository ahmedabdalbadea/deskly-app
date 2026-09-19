// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_cahce_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkspaceCacheModelAdapter extends TypeAdapter<WorkspaceCacheModel> {
  @override
  final typeId = 0;

  @override
  WorkspaceCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkspaceCacheModel(
      id: fields[0] as String,
      name: fields[1] as String,
      address: fields[2] as String,
      price: (fields[5] as num).toDouble(),
      priceUnit: fields[6] == null ? 'hr' : fields[6] as String,
      reviewsCount: (fields[7] as num).toInt(),
      latitude: (fields[8] as num).toDouble(),
      longitude: (fields[9] as num).toDouble(),
      image: fields[3] as String,
      rating: (fields[4] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkspaceCacheModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.priceUnit)
      ..writeByte(7)
      ..write(obj.reviewsCount)
      ..writeByte(8)
      ..write(obj.latitude)
      ..writeByte(9)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkspaceCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
