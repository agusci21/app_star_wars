
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vehicle_card_event.dart';
part 'vehicle_card_state.dart';

class VehicleCardBloc extends Bloc<VehicleCardEvent, VehicleCardState> {
  VehicleCardBloc() : super(Initial()) {
    on<VehicleCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
