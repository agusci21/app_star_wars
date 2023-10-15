
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/input_output/get_connection/get_connection_output.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/input_output/set_connection/set_connection_input.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/input_output/set_connection/set_connection_output.dart';

abstract class IConnectionRepository {
  Future<GetConnectionOutput> getConnection();
  Future<SetConnectionOutput> setConnection(SetConnectionInput input); 
}