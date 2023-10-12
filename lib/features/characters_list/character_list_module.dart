import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/helpers/abstractions/http_helper.dart';
import 'package:desafio_flutter_urbetrack/ioc/injector/injector.dart';
import 'package:flutter/material.dart';
import 'data/repositories/character_repository.dart';
import 'domain/repositories/i_characters_repository.dart';
import 'presentation/pages/characters_list_page.dart';

abstract class CharacterListModule {
  static const listOfCharactersPage = '/list-of-characters';

  static void registerDependencies(Injector injector) {
    injector.registerFactory<ICharacterRepository>(
      () => CharacterRepository(
        baseUrl: injector.resolveByName<String>('baseUrl'),
        httpHelper: injector.resolve<HttpHelper>(),
      ),
    );
    injector.registerFactory<CharacterListBloc>(() => CharacterListBloc(
        repository: injector.resolve<ICharacterRepository>()));
  }

  static Map<String, Widget Function(BuildContext)> generateRoutes() =>
      {listOfCharactersPage: (context) => const CharacterListPage()};
}
