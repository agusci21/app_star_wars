part of 'starship_card_bloc.dart';

sealed class StarshipCardEvent {}

final class LoadStarship extends StarshipCardEvent {
  final String id;
  LoadStarship({
    required this.id,
  });
}

final class PanelPressed extends StarshipCardEvent{}
