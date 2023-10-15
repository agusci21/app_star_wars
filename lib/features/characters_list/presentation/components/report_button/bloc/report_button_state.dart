part of 'report_button_bloc.dart';

sealed class ReportButtonState {}

final class Initial extends ReportButtonState {}

final class Loading extends ReportButtonState {}
final class CharacterReported extends ReportButtonState {}

final class Failed extends ReportButtonState {
  final String error;
  Failed({
    required this.error,
  });
}
