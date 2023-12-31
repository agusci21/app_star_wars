import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/millennium_falcon_loading_indicator.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/report_character/report_character_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/report_button/bloc/report_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportButton extends StatelessWidget {
  final ReportButtonBloc bloc;
  final Character character;
  const ReportButton({
    required this.character,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportButtonBloc, ReportButtonState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CharacterReported) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                I18n.of(context).translate('character_reported') +
                    character.name,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        if (state is Failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                I18n.of(context).translate(state.error),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: MillenniumFalconLoadingIndicator(),
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () {
              final int? id =
                  int.tryParse(character.url.getIdFromUrl('people') ?? '');
              if (id == null) {
                return;
              }

              final input = ReportCharacterInput(
                characterId: id,
                reportedDate: DateTime.now(),
                characterName: character.name,
              );
              bloc.add(ReportCharacter(input));
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Text(
                I18n.of(context).translate('report'),
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        );
      },
    );
  }
}
