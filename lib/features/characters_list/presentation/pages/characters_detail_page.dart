import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)!.settings.arguments as Character;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(I18n.of(context).translate('character_details')),
      ),
      body: Column(
        children: [
          Text(character.birthYear),
          Text(character.eyeColor),
          Text(character.gender),
          Text(character.hairColor),
          Text(character.height),
          Text(character.homeworldId),
          Text(character.mass),
          Text(character.name),
        ],
      ),
    );
  }
}
