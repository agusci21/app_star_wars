import 'package:desafio_flutter_urbetrack/core/entities/starship.dart';

class GetStarshipByIdOutput {
  final String? error;
  final Starship? starship;

  GetStarshipByIdOutput._({this.starship, this.error});
  factory GetStarshipByIdOutput.withError(String error) =>
      GetStarshipByIdOutput._(error: error);
  factory GetStarshipByIdOutput.withData(Starship starship) =>
      GetStarshipByIdOutput._(starship: starship);

  bool get hasError => error != null && starship == null;
}
