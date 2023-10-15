
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_output.dart';

abstract class IReportCharacterRepository{
  Future<ReportCharacterOutput> reportCharacter (ReportCharacterInput input);
}