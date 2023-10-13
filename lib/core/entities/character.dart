import 'package:desafio_flutter_urbetrack/core/helpers/string_helpers.dart';

class Character {
  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String homeworldId;
  final String mass;
  final String name;

  const Character({
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.homeworldId,
    required this.mass,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        birthYear: json['birth_year'],
        eyeColor: json['eye_color'],
        gender: json['gender'],
        hairColor: json['hair_color'],
        height: json['height'],
        homeworldId: (json['homeworld'] as String).getIdFromPlanetUrl() ?? '',
        mass: json['mass'],
        name: json['name'],
      );
}
