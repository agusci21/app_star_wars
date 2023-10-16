import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/character_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_characters/get_character_input.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../common_mocks/common_mocks.mocks.dart';
void main() async {
  await EnvironmentConfig.init();
   final MockIHttpHelper mockHttpHelper = MockIHttpHelper();
   final CharacterRepository repository = CharacterRepository(
        baseUrl: 'https://some_test_url', httpHelper: mockHttpHelper);
  group('Will test character repository at getting data ', () {

    final input = GetCharactersInput(page: 1, searchField: '');
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockData = {
        "count": 82,
        "next": null,
        "previous": "https://swapi.dev/api/people/?page=8",
        "results": [
          {
            "name": "Sly Moore",
            "height": "178",
            "mass": "48",
            "hair_color": "none",
            "skin_color": "pale",
            "eye_color": "white",
            "birth_year": "unknown",
            "gender": "female",
            "homeworld": "https://swapi.dev/api/planets/60/",
            "films": [
              "https://swapi.dev/api/films/5/",
              "https://swapi.dev/api/films/6/"
            ],
            "species": [],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-20T20:18:37.619000Z",
            "edited": "2014-12-20T21:17:50.496000Z",
            "url": "https://swapi.dev/api/people/82/"
          },
          {
            "name": "Tion Medon",
            "height": "206",
            "mass": "80",
            "hair_color": "none",
            "skin_color": "grey",
            "eye_color": "black",
            "birth_year": "unknown",
            "gender": "male",
            "homeworld": "https://swapi.dev/api/planets/12/",
            "films": ["https://swapi.dev/api/films/6/"],
            "species": ["https://swapi.dev/api/species/37/"],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-20T20:35:04.260000Z",
            "edited": "2014-12-20T21:17:50.498000Z",
            "url": "https://swapi.dev/api/people/83/"
          }
        ]
      };
      final mockResponse = HttpResponse(mockData, 200);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);

      final output = await repository.getCharacters(input);

      expect(output.characters, isNotEmpty);
      expect(output.error, isNull);
      verify(mockHttpHelper.get(any)).called(1);
    });

    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      final mockResponse = HttpResponse({}, 400);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);

      final output = await repository.getCharacters(input);

      expect(output.characters, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'characters_not_founded');
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => throw Exception());

      final output = await repository.getCharacters(input);

      expect(output.characters, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
  });










}
