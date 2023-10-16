import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_characters_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_characters_repository.dart';
import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';

class CharacterRepository implements ICharacterRepository {
  final String _baseUrl;
  final IHttpHelper _httpHelper;
  static const _endpoint = 'people';
  const CharacterRepository({
    required String baseUrl,
    required IHttpHelper httpHelper,
  })  : _baseUrl = baseUrl,
        _httpHelper = httpHelper;
  @override
  Future<GetCharactersOutput> getCharacters(GetCharactersInput input) async {
    String url = '$_baseUrl$_endpoint/?page=${input.page}';
    if (input.searchField.isNotEmpty) {
      url += '&search=${input.searchField}';
    }
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        final rawCharacters = (response.data['results']) as List;
        final List<Character> characters = List.generate(rawCharacters.length,
            (index) => Character.fromJson(rawCharacters[index]));
        return GetCharactersOutput.withData(
            characters: characters, hasNextPage: response.data['next'] != null);
      }
      return GetCharactersOutput.withError('characters_not_founded');
    } catch (_) {
      return GetCharactersOutput.withError('generic_error_message');
    }
  }
}
