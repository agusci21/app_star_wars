import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/core/helpers/gender_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:flutter/material.dart';

class CharacterPresentationCard extends StatelessWidget {
  final Character character;
  const CharacterPresentationCard({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(character.name),
        subtitle: Text(
            '${I18n.of(context).translate('gender')}: ${GenderHelper.getTranslatedGender(context, character.gender)}'),
        onTap: () {
          CharacterListModule.navigateToCharactersDetailsList(context,
              character: character);
        },
      ),
    );
  }
}
