import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_output.dart';

abstract class IPlanetsRepository {
  Future<GetPlanetByIdOutput> getPlanetById(GetPlanetByIdInput input);
}
