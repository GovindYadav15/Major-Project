import 'package:freezed_annotation/freezed_annotation.dart';

part 'fruit.freezed.dart';
part 'fruit.g.dart';

@freezed
class Fruit with _$Fruit {
  const factory Fruit({
    required String id,
    required String name,
    required String imageUrl,
    required String status, // unripe, ripe, overripe
    required bool isNaturalRipening,
    required double confidence,
  }) = _Fruit;

  factory Fruit.fromJson(Map<String, dynamic> json) => _$FruitFromJson(json);
}
