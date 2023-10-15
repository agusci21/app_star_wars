import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/report_character_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../common_mocks/common_mocks.mocks.dart';

void main() async {
  final MockIHttpHelper mockHttpHelper = MockIHttpHelper();
  final ReportCharacterRepository repository = ReportCharacterRepository(
      reportCharacterUrl: 'https://test_url/', httpHelper: mockHttpHelper);
  group('Will test ReportCharacter repository at posting data ', () {
    final input = ReportCharacterInput(
      characterId: 1,
      characterName: 'Test',
      reportedDate: DateTime.now(),
    );
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockResponse = HttpResponse({}, 200);
      when(mockHttpHelper.post(any,data:input.toJson() ))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.reportCharacter(input);
      expect(output.error, isNull);
      verify(mockHttpHelper.post(any, data: input.toJson())).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      const errorMessage = 'some_test_error';
      final errorResponse = {'error': errorMessage};
      final mockResponse = HttpResponse(errorResponse, 400);
      when(mockHttpHelper.post(any, data: input.toJson()))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.reportCharacter(input);
      expect(output.error, isNotNull);
      expect(output.error, errorMessage);
      verify(mockHttpHelper.post(any,data: input.toJson())).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.post(any,data: input.toJson()))
          .thenAnswer((realInvocation) async => throw Exception());
      final output = await repository.reportCharacter(input);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.post(any,data: input.toJson())).called(1);
    });
  });
}
