part of 'character_list_bloc.dart';

abstract class CharacterListState {}

class Initial extends CharacterListState {}

class Loading extends CharacterListState {}

class Loaded extends CharacterListState {
  final List<Character> characters;
  final bool hasNextPage;
  Loaded({
    required this.characters,
    required this.hasNextPage,
  });
}

class LoadingMore extends CharacterListState {
  final List<Character> characters;
  LoadingMore({
    required this.characters,
  });
}

class Failed extends CharacterListState {}
