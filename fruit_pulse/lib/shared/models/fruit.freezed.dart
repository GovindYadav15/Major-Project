// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fruit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Fruit _$FruitFromJson(Map<String, dynamic> json) {
  return _Fruit.fromJson(json);
}

/// @nodoc
mixin _$Fruit {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // unripe, ripe, overripe
  bool get isNaturalRipening => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this Fruit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FruitCopyWith<Fruit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FruitCopyWith<$Res> {
  factory $FruitCopyWith(Fruit value, $Res Function(Fruit) then) =
      _$FruitCopyWithImpl<$Res, Fruit>;
  @useResult
  $Res call({
    String id,
    String name,
    String imageUrl,
    String status,
    bool isNaturalRipening,
    double confidence,
  });
}

/// @nodoc
class _$FruitCopyWithImpl<$Res, $Val extends Fruit>
    implements $FruitCopyWith<$Res> {
  _$FruitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? isNaturalRipening = null,
    Object? confidence = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isNaturalRipening: null == isNaturalRipening
                ? _value.isNaturalRipening
                : isNaturalRipening // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FruitImplCopyWith<$Res> implements $FruitCopyWith<$Res> {
  factory _$$FruitImplCopyWith(
    _$FruitImpl value,
    $Res Function(_$FruitImpl) then,
  ) = __$$FruitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String imageUrl,
    String status,
    bool isNaturalRipening,
    double confidence,
  });
}

/// @nodoc
class __$$FruitImplCopyWithImpl<$Res>
    extends _$FruitCopyWithImpl<$Res, _$FruitImpl>
    implements _$$FruitImplCopyWith<$Res> {
  __$$FruitImplCopyWithImpl(
    _$FruitImpl _value,
    $Res Function(_$FruitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? isNaturalRipening = null,
    Object? confidence = null,
  }) {
    return _then(
      _$FruitImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isNaturalRipening: null == isNaturalRipening
            ? _value.isNaturalRipening
            : isNaturalRipening // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FruitImpl implements _Fruit {
  const _$FruitImpl({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.isNaturalRipening,
    required this.confidence,
  });

  factory _$FruitImpl.fromJson(Map<String, dynamic> json) =>
      _$$FruitImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String status;
  // unripe, ripe, overripe
  @override
  final bool isNaturalRipening;
  @override
  final double confidence;

  @override
  String toString() {
    return 'Fruit(id: $id, name: $name, imageUrl: $imageUrl, status: $status, isNaturalRipening: $isNaturalRipening, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FruitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isNaturalRipening, isNaturalRipening) ||
                other.isNaturalRipening == isNaturalRipening) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    imageUrl,
    status,
    isNaturalRipening,
    confidence,
  );

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FruitImplCopyWith<_$FruitImpl> get copyWith =>
      __$$FruitImplCopyWithImpl<_$FruitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FruitImplToJson(this);
  }
}

abstract class _Fruit implements Fruit {
  const factory _Fruit({
    required final String id,
    required final String name,
    required final String imageUrl,
    required final String status,
    required final bool isNaturalRipening,
    required final double confidence,
  }) = _$FruitImpl;

  factory _Fruit.fromJson(Map<String, dynamic> json) = _$FruitImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get status; // unripe, ripe, overripe
  @override
  bool get isNaturalRipening;
  @override
  double get confidence;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FruitImplCopyWith<_$FruitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
