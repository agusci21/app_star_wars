

import 'package:desafio_flutter_urbetrack/core/entities/character.dart';

class GetCharactersOutput {
  final bool? hasNextPage;
  final List<Character>? characters;
  final String? error;

   GetCharactersOutput._({
    this.characters,
    this.error,
    this.hasNextPage,
  });

  factory GetCharactersOutput.withData({required bool hasNextPage, required List<Character> characters}) 
    => GetCharactersOutput._(hasNextPage: hasNextPage, characters:characters);

  factory GetCharactersOutput.withError({required String error}) 
    => GetCharactersOutput._(error: error);

  bool get hasError => error != null;
}