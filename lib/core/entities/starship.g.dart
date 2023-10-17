// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StarshipImpl _$$StarshipImplFromJson(Map<String, dynamic> json) =>
    _$StarshipImpl(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      costInCredits: json['cost_in_credits'] as String,
      starshipClass: json['starship_class'] as String,
    );

Map<String, dynamic> _$$StarshipImplToJson(_$StarshipImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'cost_in_credits': instance.costInCredits,
      'starship_class': instance.starshipClass,
    };
