// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      url: json['url'] as String,
      birthYear: json['birth_year'] as String,
      eyeColor: json['eye_color'] as String,
      gender: json['gender'] as String,
      hairColor: json['hair_color'] as String,
      height: json['height'] as String,
      homeworld: json['homeworld'] as String,
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
      vehicles:
          (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      mass: json['mass'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'birth_year': instance.birthYear,
      'eye_color': instance.eyeColor,
      'gender': instance.gender,
      'hair_color': instance.hairColor,
      'height': instance.height,
      'homeworld': instance.homeworld,
      'starships': instance.starships,
      'vehicles': instance.vehicles,
      'mass': instance.mass,
      'name': instance.name,
    };
