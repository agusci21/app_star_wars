import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/planets_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'common_mocks/common_mocks.mocks.dart';


void main() async {
  await EnvironmentConfig.init();
  final MockIHttpHelper mockHttpHelper =  MockIHttpHelper();
  final PlanetsRepository repository = PlanetsRepository(
      baseUrl: 'https://some_test_url',
      httpHelper: mockHttpHelper,
    );

  group('Will test Planet repository at getting data ', () {
    final input = GetPlanetByIdInput(id: '1');
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockData = {
        "name": "Utapau",
        "rotation_period": "27",
        "orbital_period": "351",
        "diameter": "12900",
        "climate": "temperate, arid, windy",
        "gravity": "1 standard",
        "terrain": "scrublands, savanna, canyons, sinkholes",
        "surface_water": "0.9",
        "population": "95000000",
        "residents": ["https://swapi.dev/api/people/83/"],
        "films": ["https://swapi.dev/api/films/6/"],
        "created": "2014-12-10T12:49:01.491000Z",
        "edited": "2014-12-20T20:58:18.439000Z",
        "url": "https://swapi.dev/api/planets/12/"
      };
      final mockResponse = HttpResponse(mockData, 200);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getPlanetById(input);
      expect(output.planet, isNotNull);
      expect(output.error, isNull);
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      final mockResponse = HttpResponse({}, 400);
      when(mockHttpHelper.get(any)).thenAnswer(
        (realInvocation) async => mockResponse,
      );
      final output = await repository.getPlanetById(input);
      expect(output.planet, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'planet_not_founded');
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => throw Exception());
      final output = await repository.getPlanetById(input);
      expect(output.planet, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
  });
}
