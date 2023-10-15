import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/use_cases/abstractions/i_report_character_use_case.dart';

class ReportCharacterUseCase implements IReportCharacterUseCase {
  final IConnectionRepository _connectionRepository;
  ReportCharacterUseCase({
    required IConnectionRepository connectionRepository,
  }) : _connectionRepository = connectionRepository;
  @override
  Future<ReportCharacterOutput> excecute(ReportCharacterInput input) async {
    final connectionRepositoryOutput =
        await _connectionRepository.getConnection();
    if (!connectionRepositoryOutput.isConnected) {
      return ReportCharacterOutput(error: 'no_connection_error');
    }
    return ReportCharacterOutput();
  }
}
