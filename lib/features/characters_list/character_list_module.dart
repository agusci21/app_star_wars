
import 'package:flutter/material.dart';
import 'presentation/pages/characters_list_page.dart';

abstract class CharacterListModule {
  static const listOfCharactersPage = '/list-of-characters';
  
  static Map<String, Widget Function(BuildContext)> generateRoutes() => 
  {
    listOfCharactersPage: (context) => const CharacterListPage()
  };
}
