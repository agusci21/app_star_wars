import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/starship_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../common_mocks/common_mocks.mocks.dart';

void main() async {
  await EnvironmentConfig.init();
  final MockIHttpHelper mockHttpHelper = MockIHttpHelper();
  final StarshipRepository repository = StarshipRepository(
      baseUrl: 'https://test_url', httpHelper: mockHttpHelper);
  group('Will test Starship repository at getting data ', () {
    final input = GetStarshipByIdInput(id: '1');
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockData = {
        "name": "X-wing",
        "model": "T-65 X-wing",
        "manufacturer": "Incom Corporation",
        "cost_in_credits": "149999",
        "length": "12.5",
        "max_atmosphering_speed": "1050",
        "crew": "1",
        "passengers": "0",
        "cargo_capacity": "110",
        "consumables": "1 week",
        "hyperdrive_rating": "1.0",
        "MGLT": "100",
        "starship_class": "Starfighter",
        "pilots": [
          "https://swapi.dev/api/people/1/",
          "https://swapi.dev/api/people/9/",
          "https://swapi.dev/api/people/18/",
          "https://swapi.dev/api/people/19/"
        ],
        "films": [
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/2/",
          "https://swapi.dev/api/films/3/"
        ],
        "created": "2014-12-12T11:19:05.340000Z",
        "edited": "2014-12-20T21:23:49.886000Z",
        "url": "https://swapi.dev/api/starships/12/"
      };
      final mockResponse = HttpResponse(mockData, 200);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getStarshipById(input);
      expect(output.starship, isNotNull);
      expect(output.error, isNull);
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      final mockResponse = HttpResponse({}, 400);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getStarshipById(input);
      expect(output.starship, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'starship_not_founded');
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => throw Exception());
      final output = await repository.getStarshipById(input);
      expect(output.starship, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
  });
}
