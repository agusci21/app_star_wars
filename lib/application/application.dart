import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _generateRoutes(),
      initialRoute: CharacterListModule.listOfCharactersPage,
    );
  }

  Map<String, Widget Function(BuildContext)> _generateRoutes() => {
        ...CharacterListModule.generateRoutes(),
      };
}
