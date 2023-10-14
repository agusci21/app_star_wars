part of 'connection_switch_bloc.dart';

sealed class ConnectionSwitchEvent {}
final class LoadConnection extends ConnectionSwitchEvent {}
final class ToggleConnection extends ConnectionSwitchEvent {}
