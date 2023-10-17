import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required String url,
    @JsonKey(name: 'birth_year') required String birthYear,
    @JsonKey(name: 'eye_color') required String eyeColor,
    required String gender,
    @JsonKey(name: 'hair_color') required String hairColor,
    required String height,
    @JsonKey(name: 'homeworld') required String homeworld,
    required List<String> starships,
    required List<String> vehicles,
    required String mass,
    required String name,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
