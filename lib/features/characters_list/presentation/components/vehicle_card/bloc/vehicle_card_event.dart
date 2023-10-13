part of 'vehicle_card_bloc.dart';

sealed class VehicleCardEvent {}
final class LoadVehicle extends VehicleCardEvent{
  final String id;
  LoadVehicle({required this.id});
}
