// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      costInCredits: json['cost_in_credits'] as String,
      vehicleClass: json['vehicle_class'] as String,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'manufacturer': instance.manufacturer,
      'cost_in_credits': instance.costInCredits,
      'vehicle_class': instance.vehicleClass,
    };
