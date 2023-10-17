import 'package:freezed_annotation/freezed_annotation.dart';

part 'starship.freezed.dart';
part 'starship.g.dart';

@freezed
abstract class Starship with _$Starship {
  const factory Starship({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'model') required String model,
    @JsonKey(name: 'manufacturer') required String manufacturer,
    @JsonKey(name: 'cost_in_credits') required String costInCredits,
    @JsonKey(name: 'starship_class') required String starshipClass,
  }) = _Starship;

  factory Starship.fromJson(Map<String, dynamic> json) => _$StarshipFromJson(json);
}
