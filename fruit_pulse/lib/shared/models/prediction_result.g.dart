// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionResultImpl _$$PredictionResultImplFromJson(
  Map<String, dynamic> json,
) => _$PredictionResultImpl(
  isNaturalRipening: json['isNaturalRipening'] as bool,
  status: json['status'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  recommendation: json['recommendation'] as String,
);

Map<String, dynamic> _$$PredictionResultImplToJson(
  _$PredictionResultImpl instance,
) => <String, dynamic>{
  'isNaturalRipening': instance.isNaturalRipening,
  'status': instance.status,
  'confidence': instance.confidence,
  'recommendation': instance.recommendation,
};
