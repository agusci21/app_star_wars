import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'manufacturer') required String manufacturer,
    @JsonKey(name: 'cost_in_credits') required String costInCredits,
    @JsonKey(name: 'vehicle_class') required String vehicleClass,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
