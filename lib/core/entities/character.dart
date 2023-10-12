import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String birthYear,
    required String eyeColor,
    required String gender,
    required String hairColor,
    required String height,
    required String homeworld,
    required String mass,
    required String name,
  }) = _Character;
}
