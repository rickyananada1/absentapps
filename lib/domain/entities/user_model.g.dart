// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<_$UserImpl> {
  @override
  final int typeId = 0;

  @override
  _$UserImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserImpl(
      id: fields[0] as int?,
      username: fields[1] as String?,
      uid: fields[2] as String?,
      NIP: fields[3] as String?,
      EmployeeName: fields[4] as String?,
      DoH: fields[5] as String?,
      Office: fields[6] as String?,
      Department: fields[7] as String?,
      Position: fields[8] as String?,
      model_name: fields[9] as String?,
      embeddings: (fields[10] as List?)?.cast<double>(),
      distance: fields[11] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.uid)
      ..writeByte(3)
      ..write(obj.NIP)
      ..writeByte(4)
      ..write(obj.EmployeeName)
      ..writeByte(5)
      ..write(obj.DoH)
      ..writeByte(6)
      ..write(obj.Office)
      ..writeByte(7)
      ..write(obj.Department)
      ..writeByte(8)
      ..write(obj.Position)
      ..writeByte(9)
      ..write(obj.model_name)
      ..writeByte(11)
      ..write(obj.distance)
      ..writeByte(10)
      ..write(obj.embeddings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      username: json['username'] as String?,
      uid: json['uid'] as String?,
      NIP: json['NIP'] as String?,
      EmployeeName: json['EmployeeName'] as String?,
      DoH: json['DoH'] as String?,
      Office: json['Office'] as String?,
      Department: json['Department'] as String?,
      Position: json['Position'] as String?,
      model_name: json['model_name'] as String?,
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'uid': instance.uid,
      'NIP': instance.NIP,
      'EmployeeName': instance.EmployeeName,
      'DoH': instance.DoH,
      'Office': instance.Office,
      'Department': instance.Department,
      'Position': instance.Position,
      'model_name': instance.model_name,
      'embeddings': instance.embeddings,
      'distance': instance.distance,
    };
