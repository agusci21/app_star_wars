import 'package:desafio_flutter_urbetrack/abstractions/i_navigation.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/planets_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/starship_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/data/repositories/vehicle_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_planets_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_starships_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/use_cases/abstractions/i_report_character_use_case.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/use_cases/implementations/report_character_use_case.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/planet_card/bloc/planet_card_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/report_button/bloc/report_button_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/starship_card/bloc/starship_card_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/pages/characters_detail_page.dart';
import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/abstractions/i_injector.dart';
import 'package:desafio_flutter_urbetrack/features/menu/menu_module.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';
import 'data/repositories/character_repository.dart';
import 'domain/repositories/i_characters_repository.dart';
import 'domain/repositories/i_vehicle_repository.dart';
import 'presentation/components/vehicle_card/bloc/vehicle_card_bloc.dart';
import 'presentation/pages/characters_list_page.dart';

abstract class CharacterListModule {
  static const listOfCharactersPage = '/list-of-characters';
  static const characterDetailsPage = '/character-detail-page';
  static void registerDependencies(IInjector injector) {
    _registerRepositories(injector);
    _registerUseCases(injector);
    _registerBlocs(injector);
  }

  static void _registerRepositories(IInjector injector) {
    final String baseUrl = injector.resolveByName<String>('baseUrl');
    final IHttpHelper httpHelper = injector.resolve<IHttpHelper>();
    injector.registerFactory<IVehicleRepository>(
      () => VehicleRepository(
        baseUrl: baseUrl,
        httpHelper: httpHelper,
      ),
    );

    injector.registerFactory<ICharacterRepository>(
      () => CharacterRepository(
        baseUrl: baseUrl,
        httpHelper: httpHelper,
      ),
    );

    injector.registerFactory<IStarshipRepository>(
      () => StarshipRepository(
        baseUrl: baseUrl,
        httpHelper: httpHelper,
      ),
    );

    injector.registerFactory<IPlanetsRepository>(
      () => PlanetsRepository(
        baseUrl: baseUrl,
        httpHelper: httpHelper,
      ),
    );
  }

  static void _registerUseCases(IInjector injector) {
    injector.registerFactory<IReportCharacterUseCase>(
      () => ReportCharacterUseCase(
        connectionRepository: injector.resolve<IConnectionRepository>(),
      ),
    );
  }

  static void _registerBlocs(IInjector injector) {
    injector.registerFactory<CharacterListBloc>(
      () => CharacterListBloc(
        repository: injector.resolve<ICharacterRepository>(),
      ),
    );

    injector.registerFactory<VehicleCardBloc>(
      () => VehicleCardBloc(
        repository: injector.resolve<IVehicleRepository>(),
      ),
    );

    injector.registerFactory<StarshipCardBloc>(
      () => StarshipCardBloc(
        repository: injector.resolve<IStarshipRepository>(),
      ),
    );
    injector.registerFactory<PlanetCardBloc>(
      () => PlanetCardBloc(
        repository: injector.resolve<IPlanetsRepository>(),
      ),
    );

    injector.registerFactory<ReportButtonBloc>(
      () => ReportButtonBloc(
        useCase: injector.resolve<IReportCharacterUseCase>(),
      ),
    );
  }

  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        listOfCharactersPage: (context) => const CharacterListPage(),
        characterDetailsPage: (context) => const CharacterDetailPage()
      };

  static void navigateToCharactersDetailsList(BuildContext context,
      {required Character character}) {
    IocManager.instance
        .resolve<INavigation>()
        .pushNamed(context, characterDetailsPage, arguments: character);
  }

  static void navigateToMenu(BuildContext context) {
    IocManager.instance
        .resolve<INavigation>()
        .pushNamed(context, MenuModule.menuPage);
  }
}
