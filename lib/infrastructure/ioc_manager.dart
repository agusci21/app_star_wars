
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
    CharacterListModule.registerDependencies(_injector);
  }

  static void _registerCommonDependencies(Injector injector){
    injector.registerFactoryByName<String>(() => EnvironmentConfig.baseUrl, 'baseUrl');
    injector.registerFactory<HttpHelper>(() =>HttpHelperImplementation());
  }

  static Injector get instance => _injector;
}
