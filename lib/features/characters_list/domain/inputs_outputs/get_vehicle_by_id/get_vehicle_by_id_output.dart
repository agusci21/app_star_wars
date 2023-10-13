import 'package:desafio_flutter_urbetrack/core/entities/vehicle.dart';

class GetVehicleByIdOutput {
  final String? error;
  final Vehicle? vehicle;

  GetVehicleByIdOutput._({
    this.error,
    this.vehicle,
  });
  factory GetVehicleByIdOutput.withError(String error) =>
      GetVehicleByIdOutput._(error: error);
  factory GetVehicleByIdOutput.withData(Vehicle vehicle) =>
      GetVehicleByIdOutput._(vehicle: vehicle);
  bool get hasError => error != null && vehicle != null;
}
