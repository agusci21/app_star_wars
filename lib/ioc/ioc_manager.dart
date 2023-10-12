
import 'package:desafio_flutter_urbetrack/environments/environments_confi.dart';

import 'injector/injector.dart';
import 'injector/injector_implementation.dart';

abstract class IocManager {
  static late Injector _injector;

  static void register() {
    _injector = Injector.register(InjectorImplementation());
    _registerCommonDependencies(_injector);
  }

  static void _registerCommonDependencies(Injector injector){
    injector.registerFactoryByName<String>(() => EnvironmentConfig.baseUrl, 'baseUrl');
  }

  static Injector get instance => _injector;
}
