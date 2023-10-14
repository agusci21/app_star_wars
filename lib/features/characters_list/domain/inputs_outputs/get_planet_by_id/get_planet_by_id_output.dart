import 'package:desafio_flutter_urbetrack/core/entities/planet.dart';

class GetPlanetByIdOutput {
  final String? error;
  final Planet? planet;
  GetPlanetByIdOutput._({this.error, this.planet});
  factory GetPlanetByIdOutput.withError(String error) =>
      GetPlanetByIdOutput._(error: error);
  factory GetPlanetByIdOutput.withData(Planet planet) =>
      GetPlanetByIdOutput._(planet: planet);
  bool get hasError => error != null;
}
