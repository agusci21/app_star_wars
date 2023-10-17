import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_characters_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_characters_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_list_bloc_test.mocks.dart';

@GenerateMocks([ICharacterRepository])
void main() {
  final repository = MockICharacterRepository();
  final loadCharacterListEvent = LoadInitialList();
  group(
    'Test to CharacterList card bloc',
    () {
      blocTest<CharacterListBloc, CharacterListState>(
        'will test a successful petition and shouldAnswer [Loading, Loaded]',
        build: () {
          final output =
              GetCharactersOutput.withData(hasNextPage: true, characters: [
            const Character(
              id: 'id',
              birthYear: 'birthYear',
              eyeColor: 'eyeColor',
              gender: 'gender',
              hairColor: 'hairColor',
              height: 'height',
              homeworldId: 'homeworldId',
              mass: 'mass',
              name: 'name',
              starships: [],
              vehicles: [],
            ),
            const Character(
              id: 'id',
              birthYear: 'birthYear',
              eyeColor: 'eyeColor',
              gender: 'gender',
              hairColor: 'hairColor',
              height: 'height',
              homeworldId: 'homeworldId',
              mass: 'mass',
              name: 'name',
              starships: [],
              vehicles: [],
            ),
          ]);
          when(repository.getCharacters(any)).thenAnswer((_) async => output);
          return CharacterListBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadCharacterListEvent),
        expect: () => [
          isA<Loading>(),
          isA<Loaded>(),
        ],
      );
      blocTest<CharacterListBloc, CharacterListState>(
        'will test a failed petition and shouldAnswer [Loading, Failed]',
        build: () {
          final output = GetCharactersOutput.withError('some_test_error');
          when(repository.getCharacters(any)).thenAnswer((_) async => output);
          return CharacterListBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadCharacterListEvent),
        expect: () => [
          isA<Loading>(),
          isA<Failed>(),
        ],
      );
      blocTest<CharacterListBloc, CharacterListState>(
        'will test a successfull petition and shouldAnswer [Loading, Loaded, Loaded, Loaded]',
        build: () {
          final output =
              GetCharactersOutput.withData(hasNextPage: true, characters: [
            const Character(
              id: 'id',
              birthYear: 'birthYear',
              eyeColor: 'eyeColor',
              gender: 'gender',
              hairColor: 'hairColor',
              height: 'height',
              homeworldId: 'homeworldId',
              mass: 'mass',
              name: 'name',
              starships: [],
              vehicles: [],
            ),
            const Character(
              id: 'id',
              birthYear: 'birthYear',
              eyeColor: 'eyeColor',
              gender: 'gender',
              hairColor: 'hairColor',
              height: 'height',
              homeworldId: 'homeworldId',
              mass: 'mass',
              name: 'name',
              starships: [],
              vehicles: [],
            ),
          ]);
          when(repository.getCharacters(any)).thenAnswer((_) async => output);
          return CharacterListBloc(repository: repository);
        },
        act: (bloc) {
          bloc.add(loadCharacterListEvent);
          bloc.add(LoadMoreCharacters(searchField: ''));
        },
        expect: () => [
          isA<Loading>(),
          isA<Loaded>(),
          isA<Loaded>(),
          isA<Loaded>(),
        ],
      );
    },
  );
}
