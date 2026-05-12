// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PredictionResult _$PredictionResultFromJson(Map<String, dynamic> json) {
  return _PredictionResult.fromJson(json);
}

/// @nodoc
mixin _$PredictionResult {
  bool get isNaturalRipening => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // unripe, ripe, overripe
  double get confidence => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  /// Serializes this PredictionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionResultCopyWith<PredictionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionResultCopyWith<$Res> {
  factory $PredictionResultCopyWith(
    PredictionResult value,
    $Res Function(PredictionResult) then,
  ) = _$PredictionResultCopyWithImpl<$Res, PredictionResult>;
  @useResult
  $Res call({
    bool isNaturalRipening,
    String status,
    double confidence,
    String recommendation,
  });
}

/// @nodoc
class _$PredictionResultCopyWithImpl<$Res, $Val extends PredictionResult>
    implements $PredictionResultCopyWith<$Res> {
  _$PredictionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNaturalRipening = null,
    Object? status = null,
    Object? confidence = null,
    Object? recommendation = null,
  }) {
    return _then(
      _value.copyWith(
            isNaturalRipening: null == isNaturalRipening
                ? _value.isNaturalRipening
                : isNaturalRipening // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PredictionResultImplCopyWith<$Res>
    implements $PredictionResultCopyWith<$Res> {
  factory _$$PredictionResultImplCopyWith(
    _$PredictionResultImpl value,
    $Res Function(_$PredictionResultImpl) then,
  ) = __$$PredictionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isNaturalRipening,
    String status,
    double confidence,
    String recommendation,
  });
}

/// @nodoc
class __$$PredictionResultImplCopyWithImpl<$Res>
    extends _$PredictionResultCopyWithImpl<$Res, _$PredictionResultImpl>
    implements _$$PredictionResultImplCopyWith<$Res> {
  __$$PredictionResultImplCopyWithImpl(
    _$PredictionResultImpl _value,
    $Res Function(_$PredictionResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PredictionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNaturalRipening = null,
    Object? status = null,
    Object? confidence = null,
    Object? recommendation = null,
  }) {
    return _then(
      _$PredictionResultImpl(
        isNaturalRipening: null == isNaturalRipening
            ? _value.isNaturalRipening
            : isNaturalRipening // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionResultImpl implements _PredictionResult {
  const _$PredictionResultImpl({
    required this.isNaturalRipening,
    required this.status,
    required this.confidence,
    required this.recommendation,
  });

  factory _$PredictionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionResultImplFromJson(json);

  @override
  final bool isNaturalRipening;
  @override
  final String status;
  // unripe, ripe, overripe
  @override
  final double confidence;
  @override
  final String recommendation;

  @override
  String toString() {
    return 'PredictionResult(isNaturalRipening: $isNaturalRipening, status: $status, confidence: $confidence, recommendation: $recommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionResultImpl &&
            (identical(other.isNaturalRipening, isNaturalRipening) ||
                other.isNaturalRipening == isNaturalRipening) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isNaturalRipening,
    status,
    confidence,
    recommendation,
  );

  /// Create a copy of PredictionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionResultImplCopyWith<_$PredictionResultImpl> get copyWith =>
      __$$PredictionResultImplCopyWithImpl<_$PredictionResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionResultImplToJson(this);
  }
}

abstract class _PredictionResult implements PredictionResult {
  const factory _PredictionResult({
    required final bool isNaturalRipening,
    required final String status,
    required final double confidence,
    required final String recommendation,
  }) = _$PredictionResultImpl;

  factory _PredictionResult.fromJson(Map<String, dynamic> json) =
      _$PredictionResultImpl.fromJson;

  @override
  bool get isNaturalRipening;
  @override
  String get status; // unripe, ripe, overripe
  @override
  double get confidence;
  @override
  String get recommendation;

  /// Create a copy of PredictionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionResultImplCopyWith<_$PredictionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
