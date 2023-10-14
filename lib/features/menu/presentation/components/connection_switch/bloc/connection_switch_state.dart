part of 'connection_switch_bloc.dart';

sealed class ConnectionSwitchState {}

final class Initial extends ConnectionSwitchState {}
final class Loading extends ConnectionSwitchState {}
final class Loaded extends ConnectionSwitchState {
  final bool isEnabled;
  Loaded({required this.isEnabled});
}
