import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/core/helpers/gender_helper.dart';
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
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AtributeText(atribute: character.name, translationKey: 'name'),
            _AtributeText(
                atribute: character.eyeColor, translationKey: 'eye_color'),
            _AtributeText(
                atribute: character.birthYear, translationKey: 'birth_year'),
            _AtributeText(
                atribute:
                    GenderHelper.getTranslatedGender(context, character.gender),
                translationKey: 'gender'),
            _AtributeText(
              atribute: character.mass,
              translationKey: 'mass',
              secondTranslationKey: 'kilograms',
            ),
            _AtributeText(
              atribute: character.height,
              translationKey: 'height',
              secondTranslationKey: 'centimeters',
            ),
            _AtributeText(
              atribute: character.homeworldId,
              translationKey: 'homeworld',
            ),
            _AtributeText(
              atribute: character.vehicles.toString(),
              translationKey: 'vehicles',
            ),
            _AtributeText(
              atribute: character.starships.toString(),
              translationKey: 'starships',
            ),
          ],
        ),
      ),
    );
  }
}

class _AtributeText extends StatelessWidget {
  final String translationKey;
  final String atribute;
  final String secondTranslationKey;
  const _AtributeText({
    required this.atribute,
    required this.translationKey,
    this.secondTranslationKey = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        '${I18n.of(context).translate(translationKey)}: $atribute ${I18n.of(context).translate(secondTranslationKey)}',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
