import 'package:desafio_flutter_urbetrack/abstractions/http_helper.dart';
import 'package:desafio_flutter_urbetrack/core/entities/starship.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_starships_repository.dart';

class StarshipRepository implements IStarshipRepository {
  final String _baseUrl;
  final HttpHelper _httpHelper;
  static const endpoint = 'starships';
  StarshipRepository({
    required String baseUrl,
    required HttpHelper httpHelper,
  })  : _baseUrl = baseUrl,
        _httpHelper = httpHelper;
  @override
  Future<GetStarshipByIdOutput> getStarshipById(
      GetStarshipByIdInput input) async {
    final url = '$_baseUrl$endpoint/${input.id}';
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        return GetStarshipByIdOutput.withData(
          Starship.fromJson(response.data),
        );
      }
      return GetStarshipByIdOutput.withError('starship_not_founded');
    } catch (_) {
      return GetStarshipByIdOutput.withError('generic_error_message');
    }
  }
}
