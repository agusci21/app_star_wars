import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/helpers/get_id_from_lists_helper.dart';

class Character {
  final String id;
  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String homeworldId;
  final List<String> starships;
  final List<String> vehicles;
  final String mass;
  final String name;

  const Character({
    required this.id,
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.homeworldId,
    required this.mass,
    required this.name,
    required this.starships,
    required this.vehicles,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final starships = GetIdsFromListHelper.getIdsFromStarships(
        List.castFrom<dynamic, String>(json['starships']));
    final vehicles = GetIdsFromListHelper.getIdsFromVehicles(
        List.castFrom<dynamic, String>(json['vehicles']));
    return Character(
      id: (json['url'] as String).getIdFromUrl('people') ?? '',
      birthYear: json['birth_year'],
      eyeColor: json['eye_color'],
      gender: json['gender'],
      hairColor: json['hair_color'],
      height: json['height'],
      mass: json['mass'],
      name: json['name'],
      homeworldId: (json['homeworld'] as String).getIdFromUrl('planets') ?? '',
      starships: starships,
      vehicles: vehicles,
    );
  }
}
