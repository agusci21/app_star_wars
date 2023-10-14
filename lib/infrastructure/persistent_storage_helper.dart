
import 'package:desafio_flutter_urbetrack/abstractions/persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/implementations/persister_storage_implementation.dart';

abstract class PersistentStorageHelper{
  static final PersistentStorage instance = PersistentStorageImplementation();
}