import 'package:desafio_flutter_urbetrack/abstractions/i_persistent_storage.dart';
import 'package:hive_flutter/adapters.dart';

class PersistentStorage implements IPersistentStorage {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<bool?> getBool(String key) async {
    final box = await Hive.openBox('data');
    bool isConnected = box.get('in_connected', defaultValue: false);
    return isConnected;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    var box = await Hive.openBox('data');
    await box.put('in_connected', value);
    await box.close();
  }
}
