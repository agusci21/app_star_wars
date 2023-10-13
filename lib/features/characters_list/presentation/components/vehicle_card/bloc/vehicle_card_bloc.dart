import 'package:desafio_flutter_urbetrack/core/entities/vehicle.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_vehicle_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vehicle_card_event.dart';
part 'vehicle_card_state.dart';

class VehicleCardBloc extends Bloc<VehicleCardEvent, VehicleCardState> {
  final IVehicleRepository _repository;
  VehicleCardBloc({required IVehicleRepository repository})
      : _repository = repository,
        super(Initial()) {
    on<LoadVehicle>((event, emit) async {
      final input = GetVehicleByIdInput(id: event.id);
      final output = await _repository.getVehicleById(input);
      if(!output.hasError){
        emit(Loaded(vehicle: output.vehicle!, isExpanded: false));
        return;
      }
      emit(Failed(error: output.error!));
    });

    on<PannelPressed>((event, emit)  {
      if(state is Loaded){
        emit(Loaded(vehicle: (state as Loaded).vehicle, isExpanded: !(state as Loaded).isExpanded));
      }
    });
  }
}
