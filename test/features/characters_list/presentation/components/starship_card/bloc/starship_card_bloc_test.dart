import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_flutter_urbetrack/core/entities/starship.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_starships_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/bloc/starship_card_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'starship_card_bloc_test.mocks.dart';

@GenerateMocks([IStarshipRepository])
void main() {
  final repository = MockIStarshipRepository();
  final loadStarshipEvent = LoadStarship(id: '1');
  group(
    'Test to Starship card bloc',
    () {
      blocTest<StarshipCardBloc, StarshipCardState>(
        'will test a successful petition and shouldAnswer [Loaded]',
        build: () {
      final output = GetStarshipByIdOutput.withData(
        Starship(
          costInCredits: 'test',
          manufacturer: 'test',
          model: 'test',
          name: 'test',
          starshipClass: 'test',
        ),
      );
          when(repository.getStarshipById(any)).thenAnswer((_) async => output);
          return StarshipCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadStarshipEvent),
        expect: () => [isA<Loaded>()],
      );
      blocTest<StarshipCardBloc, StarshipCardState>(
        'will test a failed petition and shouldAnswer [Failed]',
        build: () {
          final output = GetStarshipByIdOutput.withError('some_test_error');
          when(repository.getStarshipById(any)).thenAnswer((_) async => output);
          return StarshipCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadStarshipEvent),
        expect: () => [isA<Failed>()],
      );
    },
  );
}