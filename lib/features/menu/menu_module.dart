import 'package:desafio_flutter_urbetrack/abstractions/i_injector.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/components/connection_switch/bloc/connection_switch_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';

abstract class MenuModule {
  static const menuPage = '/menu';
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        menuPage: (context) => const MenuPage(),
      };

  static void registerDependencies(IInjector injector) {
    _registerBlocs(injector);
  }

  static void _registerBlocs(IInjector injector) {
    injector.registerFactory<ConnectionSwitchBloc>(
      () => ConnectionSwitchBloc(
        repository: injector.resolve<IConnectionRepository>(),
      ),
    );
  }
}
