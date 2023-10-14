import 'package:desafio_flutter_urbetrack/abstractions/injector.dart';
import 'package:desafio_flutter_urbetrack/abstractions/persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/components/connection_switch/bloc/connection_switch_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';

import 'data/repositories/connection_repository.dart';
import 'domain/repositories/i_connection_repository.dart';

abstract class MenuModule {
  static const menuPage = '/menu';
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        menuPage: (context) => const MenuPage(),
      };

  static void registerDependencies(Injector injector) {
    _registerRepositories(injector);
    _registerBlocs(injector);
  }

  static void _registerBlocs(Injector injector) {
    injector.registerFactory<ConnectionSwitchBloc>(() => ConnectionSwitchBloc(
        repository: injector.resolve<IConnectionRepository>()));
  }

  static void _registerRepositories(Injector injector) {
    injector.registerFactory<IConnectionRepository>(
      () => ConnectionRepository(
        persistentStorage: injector.resolve<PersistentStorage>(),
      ),
    );
  }
}
