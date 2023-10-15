import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_report_character_repository.dart';

class ReportCharacterRepository implements IReportCharacterRepository {
  final String _reportCharacterUrl;
  final IHttpHelper _httpHelper;
  static const _endpoint = 'posts';
  ReportCharacterRepository({
    required String reportCharacterUrl,
    required IHttpHelper httpHelper,
  })  : _reportCharacterUrl = reportCharacterUrl,
        _httpHelper = httpHelper;
  @override
  Future<ReportCharacterOutput> reportCharacter(
      ReportCharacterInput input) async {
    final String url = '$_reportCharacterUrl$_endpoint';
    try {
      final response = await _httpHelper.post(url, data: input.toJson());
      if (response.isOk) {
        return ReportCharacterOutput();
      }
      return ReportCharacterOutput(error: response.data['error']);
    } catch (_) {
      return ReportCharacterOutput(error: 'generic_error_message');
    }
  }
}
