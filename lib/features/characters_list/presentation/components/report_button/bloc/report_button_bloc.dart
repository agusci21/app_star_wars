import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/use_cases/abstractions/i_report_character_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'report_button_event.dart';
part 'report_button_state.dart';

class ReportButtonBloc extends Bloc<ReportButtonEvent, ReportButtonState> {
  final IReportCharacterUseCase _useCase;
  ReportButtonBloc({
    required IReportCharacterUseCase useCase,
  })  : _useCase = useCase,
        super(Initial()) {
    on<ReportCharacter>((event, emit) async {
      emit(Loading());
      final output = await _useCase.excecute(event.input);
      if (output.hasError) {
        emit(
          Failed(error: output.error!),
        );
        return;
      }
      emit(CharacterReported());
    });
  }
}
