part of 'planet_card_bloc.dart';

sealed class PlanetCardState {}

final class Initial extends PlanetCardState {}

final class Loading extends PlanetCardState {}

final class Loaded extends PlanetCardState {
  final Planet planet;
  final bool isExpanded;
  Loaded({
    required this.isExpanded,
    required this.planet,
  });
}

final class Failed extends PlanetCardState {}
