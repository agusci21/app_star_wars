typedef FactoryFunc<T> = T Function();

abstract class Injector {
  static Injector? instance;

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc);

  void registerFactoryByName<T extends Object>(
      FactoryFunc<T> factoryFunc, String name);

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc);

  T resolve<T extends Object>();

  T resolveByName<T extends Object>(String name);

  bool isRegistered<T extends Object>();

  static Injector register(Injector implementation) {
    instance = implementation;
    return instance!;
  }
}
