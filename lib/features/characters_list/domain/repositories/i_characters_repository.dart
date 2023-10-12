
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_characters_output.dart';

abstract class ICharacterRepository{
  Future<GetCharactersOutput> getCharacters (GetCharactersInput input);
}