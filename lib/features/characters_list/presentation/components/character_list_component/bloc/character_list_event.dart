part of 'character_list_bloc.dart';

sealed class CharacterListEvent {}

final class LoadInitialList extends CharacterListEvent {}

final class LoadMoreCharacters extends CharacterListEvent {
  final String searchField;
  LoadMoreCharacters({
    required this.searchField,
  });
}

final class Search extends CharacterListEvent {
  final String searchField;
  Search({
    required this.searchField,
  });
}
