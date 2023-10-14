
import 'package:desafio_flutter_urbetrack/abstractions/persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/features/menu/domain/input_output/get_connection/get_connection_output.dart';
import 'package:desafio_flutter_urbetrack/features/menu/domain/input_output/set_connection/set_connection_input.dart';
import 'package:desafio_flutter_urbetrack/features/menu/domain/input_output/set_connection/set_connection_output.dart';
import 'package:desafio_flutter_urbetrack/features/menu/domain/repositories/i_connection_repository.dart';

class ConnectionRepository implements IConnectionRepository{
  final PersistentStorage _persistentStorage;
  static const _connectionKey = 'is_connected';
  ConnectionRepository({required PersistentStorage persistentStorage}): _persistentStorage = persistentStorage ;
  @override
  Future<GetConnectionOutput> getConnection() async {
    try {
       final isConnected = await _persistentStorage.getBool(_connectionKey);
       return GetConnectionOutput(isConnected: isConnected ?? false);
    } catch (e) {
      return GetConnectionOutput(isConnected: false);
    }
  }

  @override
  Future<SetConnectionOutput> setConnection(SetConnectionInput input) async {
    try {
      await _persistentStorage.setBool(_connectionKey, input.value);
      return SetConnectionOutput();
    } catch (e) {
      return SetConnectionOutput(error: 'generic_error_message');
    }
  }

}