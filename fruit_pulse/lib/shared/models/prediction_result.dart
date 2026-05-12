import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction_result.freezed.dart';
part 'prediction_result.g.dart';

@freezed
class PredictionResult with _$PredictionResult {
  const factory PredictionResult({
    required bool isNaturalRipening,
    required String status, // unripe, ripe, overripe
    required double confidence,
    required String recommendation,
  }) = _PredictionResult;

  factory PredictionResult.fromJson(Map<String, dynamic> json) =>
      _$PredictionResultFromJson(json);
}
