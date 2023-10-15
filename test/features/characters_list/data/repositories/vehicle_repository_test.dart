import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/vehicle_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_input.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../common_mocks/common_mocks.mocks.dart';

void main() async {
  final MockIHttpHelper mockHttpHelper = MockIHttpHelper();
  final VehicleRepository repository = VehicleRepository(
      baseUrl: 'https://test_url', httpHelper: mockHttpHelper);

  group('Will test Vehicle repository at getting data ', () {
    final input = GetVehicleByIdInput(id: '1');
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockData = {
        "name": "Snowspeeder",
        "model": "t-47 airspeeder",
        "manufacturer": "Incom corporation",
        "cost_in_credits": "unknown",
        "length": "4.5",
        "max_atmosphering_speed": "650",
        "crew": "2",
        "passengers": "0",
        "cargo_capacity": "10",
        "consumables": "none",
        "vehicle_class": "airspeeder",
        "pilots": [
          "https://swapi.dev/api/people/1/",
          "https://swapi.dev/api/people/18/"
        ],
        "films": ["https://swapi.dev/api/films/2/"],
        "created": "2014-12-15T12:22:12Z",
        "edited": "2014-12-20T21:30:21.672000Z",
        "url": "https://swapi.dev/api/vehicles/14/"
      };
      final mockResponse = HttpResponse(mockData, 200);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getVehicleById(input);
      expect(output.vehicle, isNotNull);
      expect(output.error, isNull);
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      final mockResponse = HttpResponse({}, 400);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getVehicleById(input);
      expect(output.vehicle, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'vehicle_not_founded');
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => throw Exception());
      final output = await repository.getVehicleById(input);
      expect(output.vehicle, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
  });
}
