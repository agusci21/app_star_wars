import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
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
        subtitle: Text(_getSubtitle(context, character.gender)),
        onTap: () {
          CharacterListModule.navigateToCharactersDetailsList(context,
              character: character);
        },
      ),
    );
  }

  String _getSubtitle(BuildContext context, String gender) {
    String translatedGender;
    if (gender == 'male') {
      translatedGender = I18n.of(context).translate(gender);
    } else if (gender == 'female') {
      translatedGender = I18n.of(context).translate(gender);
    } else {
      translatedGender = I18n.of(context).translate('other_gender');
    }
    return '${I18n.of(context).translate('gender')}: $translatedGender';
  }
}
