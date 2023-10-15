import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart';
import 'package:desafio_flutter_urbetrack/core/entities/vehicle.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_vehicle_repository.dart';

class VehicleRepository implements IVehicleRepository {
  final String _baseUrl;
  final IHttpHelper _httpHelper;
  static const _endpoint = 'vehicles';
  VehicleRepository({required String baseUrl, required IHttpHelper httpHelper})
      : _baseUrl = baseUrl,
        _httpHelper = httpHelper;

  @override
  Future<GetVehicleByIdOutput> getVehicleById(GetVehicleByIdInput input) async {
    final String url = '$_baseUrl$_endpoint/${input.id}';
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        return GetVehicleByIdOutput.withData(Vehicle.fromJson(response.data));
      }
      return GetVehicleByIdOutput.withError('vehicle_not_founded');
    } catch (_) {
      return GetVehicleByIdOutput.withError('generic_error_message');
    }
  }
}
