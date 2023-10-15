import 'package:desafio_flutter_urbetrack/abstractions/i_injector.dart';
import 'package:get_it/get_it.dart';

class Injector implements IInjector {
  static final Injector _singleton = Injector._internal();
  final GetIt _getIt = GetIt.asNewInstance();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  @override
  void registerFactory<T extends Object>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerFactoryByName<T extends Object>(factoryFunc, String name) {
    if (_getIt.isRegistered<T>(instanceName: name)) {
      _getIt.unregister<T>(instanceName: name);
    }
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerLazySingleton(factoryFunc);
  }

  @override
  T resolve<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  T resolveByName<T extends Object>(String name) {
    return _getIt.get<T>(
      instanceName: name,
    );
  }

  @override
  bool isRegistered<T extends Object>() {
    return _getIt.isRegistered<T>();
  }
}
