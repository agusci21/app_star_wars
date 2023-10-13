import 'package:desafio_flutter_urbetrack/abstractions/navigation_helper.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/pages/characters_detail_page.dart';
import 'package:desafio_flutter_urbetrack/abstractions/http_helper.dart';
import 'package:desafio_flutter_urbetrack/abstractions/injector.dart';
import 'package:flutter/material.dart';
import 'data/repositories/character_repository.dart';
import 'domain/repositories/i_characters_repository.dart';
import 'presentation/pages/characters_list_page.dart';

abstract class CharacterListModule {
  static const listOfCharactersPage = '/list-of-characters';
  static const characterDetailsPage = '/character-detail-page';
  static void registerDependencies(Injector injector) {
    injector.registerFactory<ICharacterRepository>(
      () => CharacterRepository(
        baseUrl: injector.resolveByName<String>('baseUrl'),
        httpHelper: injector.resolve<HttpHelper>(),
      ),
    );
    injector.registerFactory<CharacterListBloc>(
      () => CharacterListBloc(
        repository: injector.resolve<ICharacterRepository>(),
      ),
    );
  }

  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        listOfCharactersPage: (context) => const CharacterListPage(),
        characterDetailsPage: (context) => const CharacterDetailPage()
      };
  static void navigateToCharactersDetailsList(BuildContext context,
      {required Character character}) {
    NavigationHelper.of(context)
        .pushNamed(characterDetailsPage, arguments: character);
  }
}
