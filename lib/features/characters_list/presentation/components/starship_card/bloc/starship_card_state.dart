part of 'starship_card_bloc.dart';

sealed class StarshipCardState {}

final class Initial extends StarshipCardState {}
final class Loaded extends StarshipCardState {
  final Starship starship;
  final bool isExpanded;
  Loaded({
    required this.starship,
    required this.isExpanded,
  });
}
final class Loading extends StarshipCardState {}
final class Failed extends StarshipCardState {}
