import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_flutter_urbetrack/core/entities/planet.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_planets_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/bloc/planet_card_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'planet_card_bloc_test.mocks.dart';

@GenerateMocks([IPlanetsRepository])
void main() {
  final repository = MockIPlanetsRepository();
  final loadPlanetEvent = LoadPlanet(id: '1');
  group(
    'Test to planet card bloc',
    () {
      blocTest<PlanetCardBloc, PlanetCardState>(
        'will test a successful petition and shouldAnswer [Loaded]',
        build: () {
      final output = GetPlanetByIdOutput.withData(
        const Planet(
          name: 'test',
          orbitalPeriod: 'test',
          population: 'test',
          rotationPeriod: 'test',
          surfaceWater: 'test',
        ),
      );
          when(repository.getPlanetById(any)).thenAnswer((_) async => output);
          return PlanetCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadPlanetEvent),
        expect: () => [isA<Loaded>()],
      );
      blocTest<PlanetCardBloc, PlanetCardState>(
        'will test a failed petition and shouldAnswer [Failed]',
        build: () {
          final output = GetPlanetByIdOutput.withError('some_test_error');
          when(repository.getPlanetById(any)).thenAnswer((_) async => output);
          return PlanetCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadPlanetEvent),
        expect: () => [isA<Failed>()],
      );
    },
  );
}
