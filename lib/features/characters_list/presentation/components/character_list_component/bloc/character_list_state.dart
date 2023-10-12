part of 'character_list_bloc.dart';

abstract class CharacterListState{}

class Initial extends CharacterListState{}
class Loading extends CharacterListState{}
class Loaded extends CharacterListState{
  final List<Character> characters;
  Loaded({required this.characters});
}
class Failed extends CharacterListState{}
