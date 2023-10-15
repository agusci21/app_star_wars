import 'package:desafio_flutter_urbetrack/application/localizations/locales.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:desafio_flutter_urbetrack/features/menu/menu_module.dart';
import 'package:flutter/material.dart';

import 'localizations/i18n.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        splashColor: const Color(0xffffe919),
        snackBarTheme: SnackBarThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: _generateRoutes(),
      initialRoute: CharacterListModule.listOfCharactersPage,
      localizationsDelegates: const [AppLocalizationsDelegate()],
      supportedLocales: Locales.suportedLanguages,
    );
  }

  Map<String, Widget Function(BuildContext)> _generateRoutes() => {
        ...CharacterListModule.generateRoutes(),
        ...MenuModule.generateRoutes(),
      };
}
