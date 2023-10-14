import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/bloc/planet_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetCard extends StatelessWidget {
  final String planetId;
  final PlanetCardBloc bloc;
  const PlanetCard({
    required this.planetId,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          bloc: bloc..add(LoadPlanet(id: planetId)),
          builder: (context, state) {
            if (state is Loaded) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    bloc.add(PanelPressed());
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: state.isExpanded,
                      headerBuilder: (context, isExpanded) => Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          state.planet.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      body: Container(
                        margin: const EdgeInsets.only(left: 8, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
