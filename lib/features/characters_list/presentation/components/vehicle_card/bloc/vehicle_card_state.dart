part of 'vehicle_card_bloc.dart';

sealed class VehicleCardState {}

final class Initial extends VehicleCardState {}

final class Loading extends VehicleCardState {}

final class Loaded extends VehicleCardState {
  final Vehicle vehicle;
  final bool isExpanded;
  Loaded({
    required this.vehicle,
    required this.isExpanded,
  });
}

final class Failed extends VehicleCardState {
  final String error;
  Failed({required this.error});
}
