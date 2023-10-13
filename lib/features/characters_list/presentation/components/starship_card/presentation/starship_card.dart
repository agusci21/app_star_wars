import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/bloc/starship_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarshipCard extends StatelessWidget {
  final String starshipId;
  final StarshipCardBloc bloc;
  const StarshipCard({
    required this.starshipId,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const expansionPanelTextStyle = TextStyle(fontSize: 17);
    return BlocBuilder<StarshipCardBloc, StarshipCardState>(
      bloc: bloc..add(LoadStarship(id: starshipId)),
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
                      state.starship.name,
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
    );
  }
}
