import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final ICharacterRepository _repository;
  CharacterListBloc({required ICharacterRepository repository})
      : _repository = repository,
        super(Initial()) {
    on<LoadInitialList>((event, emit) async {
      emit(Loading());
      final input = GetCharactersInput(page: 0);
      final output = await _repository.getCharacters(input);
      if (output.hasError) {
        emit(Failed());
        return;
      }
      emit(Loaded(characters: output.characters!));
      return;
    });
  }
}
