

abstract class PersistentStorage {
  Future<void> init();
  Future<bool?> getBool(String key);
  Future<void> setBool(String key, bool value); 
}