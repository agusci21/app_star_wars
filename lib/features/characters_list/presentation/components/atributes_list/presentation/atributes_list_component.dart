import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/helpers/gender_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/bloc/planet_card_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/presentation/planet_card.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/report_button/bloc/report_button_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/report_button/presentation/report_button.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starships_list/presentation/starships_list.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicles_list/presentation/vehicles_list_component.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

class AtributeList extends StatelessWidget {
  final Character character;
  const AtributeList({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
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
            PlanetCard(
                planetId: character.homeworld.getIdFromUrl('planets') ?? '',
                bloc: IocManager.instance.resolve<PlanetCardBloc>()),
            if (character.starships.isNotEmpty)
              StarshipsList(starshipsIds: character.starships),
            if (character.vehicles.isNotEmpty)
              VehiclesList(vehiclesIds: character.vehicles),
            ReportButton(
              character: character,
              bloc: IocManager.instance.resolve<ReportButtonBloc>(),
            )
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
