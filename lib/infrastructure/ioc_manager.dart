import 'package:desafio_flutter_urbetrack/abstractions/i_navigation.dart';
import 'package:desafio_flutter_urbetrack/abstractions/i_persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/data/repositories/connection_repository.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/features/menu/menu_module.dart';
import 'package:desafio_flutter_urbetrack/implementations/navigation.dart';
import 'package:desafio_flutter_urbetrack/implementations/persister_storage.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/implementations/http_helper.dart';

import '../abstractions/i_injector.dart';
import '../implementations/injector.dart';

abstract class IocManager {
  static late IInjector _injector;

  static void register() {
    _injector = IInjector.register(Injector());
    _registerCommonDependencies(_injector);
    _registerCommonRepositories(_injector);
    CharacterListModule.registerDependencies(_injector);
    MenuModule.registerDependencies(_injector);
  }

  static void _registerCommonDependencies(IInjector injector) {
    injector.registerFactoryByName<String>(
        () => EnvironmentConfig.baseUrl, 'baseUrl');
    injector.registerFactory<IHttpHelper>(
      () => HttpHelper(),
    );
    injector.registerLazySingleton<IPersistentStorage>(
      () => PersistentStorage(),
    );
    injector.registerFactory<INavigation>(() => Navigation());
  }

  static void _registerCommonRepositories(IInjector injector) {
    injector.registerFactory<IConnectionRepository>(
      () => ConnectionRepository(
        persistentStorage: injector.resolve<IPersistentStorage>(),
      ),
    );
  }

  static IInjector get instance => _injector;
}
