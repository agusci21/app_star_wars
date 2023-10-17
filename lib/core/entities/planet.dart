import 'package:freezed_annotation/freezed_annotation.dart';

part 'planet.freezed.dart';
part 'planet.g.dart';

@freezed
abstract class Planet with _$Planet {
  const factory Planet({
    required String name,
    @JsonKey(name: 'rotation_period') required String rotationPeriod,
    @JsonKey(name: 'orbital_period') required String orbitalPeriod,
    required String population,
    @JsonKey(name: 'surface_water') required String surfaceWater,
  }) = _Planet;

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}
