import 'package:desafio_flutter_urbetrack/abstractions/i_navigation.dart';
import 'package:desafio_flutter_urbetrack/abstractions/persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/data/repositories/connection_repository.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:desafio_flutter_urbetrack/features/menu/menu_module.dart';
import 'package:desafio_flutter_urbetrack/implementations/navigation.dart';
import 'package:desafio_flutter_urbetrack/implementations/persister_storage_implementation.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:desafio_flutter_urbetrack/abstractions/http_helper.dart';
import 'package:desafio_flutter_urbetrack/implementations/http_helper_implementation.dart';

import '../abstractions/injector.dart';
import '../implementations/injector_implementation.dart';

abstract class IocManager {
  static late Injector _injector;

  static void register() {
    _injector = Injector.register(InjectorImplementation());
    _registerCommonDependencies(_injector);
    _registerCommonRepositories(_injector);
    CharacterListModule.registerDependencies(_injector);
    MenuModule.registerDependencies(_injector);
  }

  static void _registerCommonDependencies(Injector injector) {
    injector.registerFactoryByName<String>(
        () => EnvironmentConfig.baseUrl, 'baseUrl');
    injector.registerFactory<HttpHelper>(
      () => HttpHelperImplementation(),
    );
    injector.registerLazySingleton<PersistentStorage>(
      () => PersistentStorageImplementation(),
    );
    injector.registerFactory<INavigation>(() => Navigation());
    
  }

  static void _registerCommonRepositories(Injector injector) {
    injector.registerFactory<IConnectionRepository>(() => ConnectionRepository(persistentStorage: injector.resolve<PersistentStorage>(),),);
  }

  static Injector get instance => _injector;
}
