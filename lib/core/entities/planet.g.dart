// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanetImpl _$$PlanetImplFromJson(Map<String, dynamic> json) => _$PlanetImpl(
      name: json['name'] as String,
      rotationPeriod: json['rotation_period'] as String,
      orbitalPeriod: json['orbital_period'] as String,
      population: json['population'] as String,
      surfaceWater: json['surface_water'] as String,
    );

Map<String, dynamic> _$$PlanetImplToJson(_$PlanetImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rotation_period': instance.rotationPeriod,
      'orbital_period': instance.orbitalPeriod,
      'population': instance.population,
      'surface_water': instance.surfaceWater,
    };
