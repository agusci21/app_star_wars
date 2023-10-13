
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_output.dart';

abstract class IVehicleRepository {
  Future<GetVehicleByIdOutput> getVehicleById (GetVehicleByIdInput input);
}