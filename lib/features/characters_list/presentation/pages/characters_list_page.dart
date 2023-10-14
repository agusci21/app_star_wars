import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/presentation/character_list.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(I18n.of(context).translate('star_wars_characters')),
          leading: IconButton(
            onPressed: () => CharacterListModule.navigateToMenu(context),
            icon: const Icon(Icons.settings),
          ),
        ),
        body: CharacterList(
            bloc: IocManager.instance.resolve<CharacterListBloc>()));
  }
}
