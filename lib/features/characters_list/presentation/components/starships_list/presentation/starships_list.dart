import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/bloc/starship_card_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/presentation/starship_card.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

class StarshipsList extends StatelessWidget {
  final List<String> starshipsIds;
  const StarshipsList({
    required this.starshipsIds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          I18n.of(context).translate('starships'),
          style: const TextStyle(fontSize: 26),
        ),
        for (final id in starshipsIds)
          StarshipCard(
            starshipUrl: id,
            bloc: IocManager.instance.resolve<StarshipCardBloc>(),
          )
      ],
    );
  }
}
