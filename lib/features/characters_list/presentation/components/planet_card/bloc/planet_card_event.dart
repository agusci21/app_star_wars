part of 'planet_card_bloc.dart';

sealed class PlanetCardEvent {}

final class LoadPlanet extends PlanetCardEvent {
  final String id;
  LoadPlanet({required this.id});
}
final class PanelPressed extends PlanetCardEvent {}
