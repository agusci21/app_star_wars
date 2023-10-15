abstract class IPersistentStorage {
  Future<void> init();
  Future<bool?> getBool(String key);
  Future<void> setBool(String key, bool value);
}
