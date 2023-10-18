import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/custom_expansion_panel.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/millennium_falcon_loading_indicator.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/bloc/planet_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetCard extends StatelessWidget {
  final String planetUrl;
  final PlanetCardBloc bloc;
  const PlanetCard({
    required this.planetUrl,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? id = planetUrl.getIdFromUrl('planets');
    if(id == null){
      return const SizedBox();
    }
    const expansionPanelTextStyle = TextStyle(fontSize: 17);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          I18n.of(context).translate('homeworld'),
          style: const TextStyle(fontSize: 25),
        ),
        BlocBuilder<PlanetCardBloc, PlanetCardState>(
          bloc: bloc..add(LoadPlanet(id: id)),
          builder: (context, state) {
            if (state is Loaded) {
              return CustomExpansionPanel(
                  expansionCallback: (panelIndex, isExpanded) {
                    bloc.add(PanelPressed());
                  },
                  isExpanded: state.isExpanded,
                  title: state.planet.name,
                  content: [
                    Text(
                      '${I18n.of(context).translate('rotation_period')}: ${state.planet.rotationPeriod}',
                      style: expansionPanelTextStyle,
                    ),
                    Text(
                        '${I18n.of(context).translate('orbital_period')}: ${state.planet.orbitalPeriod}',
                        style: expansionPanelTextStyle),
                    Text(
                        '${I18n.of(context).translate('population')}: ${state.planet.population}',
                        style: expansionPanelTextStyle),
                    Text(
                        '${I18n.of(context).translate('surface_water')}: ${state.planet.surfaceWater}',
                        style: expansionPanelTextStyle),
                  ]);
            }
            return const Center(
              child: MillenniumFalconLoadingIndicator(),
            );
          },
        ),
      ],
    );
  }
}
