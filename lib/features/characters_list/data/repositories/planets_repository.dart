import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/core/entities/planet.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_planets_repository.dart';

class PlanetsRepository implements IPlanetsRepository {
  final String _baseUrl;
  final IHttpHelper _httpHelper;
  static const _endpoint = '/planets';
  PlanetsRepository({required String baseUrl, required IHttpHelper httpHelper})
      : _baseUrl = baseUrl,
        _httpHelper = httpHelper;
  @override
  Future<GetPlanetByIdOutput> getPlanetById(GetPlanetByIdInput input) async {
    final url = '$_baseUrl$_endpoint/${input.id}';
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        return GetPlanetByIdOutput.withData(
          Planet.fromJson(response.data),
        );
      }
      return GetPlanetByIdOutput.withError('planet_not_founded');
    } catch (_) {
      return GetPlanetByIdOutput.withError('generic_error_message');
    }
  }
}
