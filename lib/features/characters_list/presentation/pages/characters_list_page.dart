import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/presentation/character_list.dart';
import 'package:desafio_flutter_urbetrack/ioc/ioc_manager.dart';
import 'package:flutter/material.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Personajes de Star Wars'),
      ),
      body: CharacterList(bloc: IocManager.instance.resolve<CharacterListBloc>())
    );
  }
}
