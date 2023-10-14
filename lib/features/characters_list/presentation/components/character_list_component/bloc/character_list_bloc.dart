import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final ICharacterRepository _repository;
  int _page = 1;
  CharacterListBloc({required ICharacterRepository repository})
      : _repository = repository,
        super(Initial()) {
    on<LoadInitialList>((event, emit) async {
      emit(Loading());
      _page = 1;
      final input = GetCharactersInput(page: 1);
      final output = await _repository.getCharacters(input);
      if (output.hasError) {
        emit(Failed());
        return;
      }
      emit(Loaded(
          characters: output.characters!, hasNextPage: output.hasNextPage!));
      return;
    });

    on<LoadMoreCharacters>((event, emit) async {
      if (state is! Loaded) {
        return;
      }
      final previousState = state as Loaded;
      if (!previousState.hasNextPage) {
        return;
      }
      emit(LoadingMore(characters: previousState.characters));
      final input = GetCharactersInput(page: _page + 1);
      final output = await _repository.getCharacters(input);
      if (output.hasError) {
        emit(Failed());
        return;
      }
      _page++;
      emit(
        Loaded(
          characters: [...previousState.characters, ...output.characters!],
          hasNextPage: output.hasNextPage!,
        ),
      );
    });
  }
}
