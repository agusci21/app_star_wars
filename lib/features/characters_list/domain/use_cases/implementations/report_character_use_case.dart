import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_report_character_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/use_cases/abstractions/i_report_character_use_case.dart';

class ReportCharacterUseCase implements IReportCharacterUseCase {
  final IConnectionRepository _connectionRepository;
  final IReportCharacterRepository _reportCharacterRepository;
  ReportCharacterUseCase({
    required IReportCharacterRepository reportCharacterRepository,
    required IConnectionRepository connectionRepository,
  }) : _connectionRepository = connectionRepository, _reportCharacterRepository = reportCharacterRepository;
  @override
  Future<ReportCharacterOutput> excecute(ReportCharacterInput input) async {
    final connectionRepositoryOutput =
        await _connectionRepository.getConnection();
    if (!connectionRepositoryOutput.isConnected) {
      return ReportCharacterOutput(error: 'no_connection_error');
    }
    final reportCharacterOutput = await _reportCharacterRepository.reportCharacter(input);
    if(reportCharacterOutput.hasError){
      return ReportCharacterOutput(error: reportCharacterOutput.error);
    }
    return ReportCharacterOutput();
  }
}
