import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/custom_expansion_panel.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/millennium_falcon_loading_indicator.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/bloc/starship_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarshipCard extends StatelessWidget {
  final String starshipUrl;
  final StarshipCardBloc bloc;
  const StarshipCard({
    required this.starshipUrl,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? id = starshipUrl.getIdFromUrl('starships');
    const expansionPanelTextStyle = TextStyle(fontSize: 17);
    if(id == null){
      return const SizedBox();
    }
    return BlocBuilder<StarshipCardBloc, StarshipCardState>(
      bloc: bloc
        ..add(
          LoadStarship(id: id),
        ),
      builder: (context, state) {
        if (state is Loaded) {
          return CustomExpansionPanel(
              expansionCallback: (panelIndex, isExpanded) {
                bloc.add(PanelPressed());
              },
              isExpanded: state.isExpanded,
              title: state.starship.name,
              content: [
                Text(
                  '${I18n.of(context).translate('starship_class')}: ${state.starship.starshipClass}',
                  style: expansionPanelTextStyle,
                ),
                Text(
                  '${I18n.of(context).translate('starship_model')}: ${state.starship.model}',
                  style: expansionPanelTextStyle,
                ),
                Text(
                  '${I18n.of(context).translate('manufacturer')}: ${state.starship.manufacturer}',
                  style: expansionPanelTextStyle,
                ),
                Text(
                  '${I18n.of(context).translate('cost')}: ${state.starship.costInCredits}',
                  style: expansionPanelTextStyle,
                ),
              ]);
        }
        return const Center(
          child: MillenniumFalconLoadingIndicator(),
        );
      },
    );
  }
}
