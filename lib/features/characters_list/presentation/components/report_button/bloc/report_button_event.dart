part of 'report_button_bloc.dart';

sealed class ReportButtonEvent {}

final class ReportCharacter extends ReportButtonEvent {
  final ReportCharacterInput input;
  ReportCharacter(this.input);
}
