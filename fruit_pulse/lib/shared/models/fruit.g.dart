// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FruitImpl _$$FruitImplFromJson(Map<String, dynamic> json) => _$FruitImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  status: json['status'] as String,
  isNaturalRipening: json['isNaturalRipening'] as bool,
  confidence: (json['confidence'] as num).toDouble(),
);

Map<String, dynamic> _$$FruitImplToJson(_$FruitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'isNaturalRipening': instance.isNaturalRipening,
      'confidence': instance.confidence,
    };
