import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/atributes_list/presentation/atributes_list_component.dart';
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
      body: AtributeList(character: character),
    );
  }
}
