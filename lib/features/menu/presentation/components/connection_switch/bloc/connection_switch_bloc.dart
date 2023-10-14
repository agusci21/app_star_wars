import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_switch_event.dart';
part 'connection_switch_state.dart';

class ConnectionSwitchBloc
    extends Bloc<ConnectionSwitchEvent, ConnectionSwitchState> {
  ConnectionSwitchBloc() : super(Initial()) {
    on<LoadConnection>((event, emit) {
      emit(Loaded(isEnabled: false));
    });

    on<ToggleConnection>((event, emit) {
      if (state is Loaded) {
        final bool isEnabled = (state as Loaded).isEnabled;
        emit(
          Loaded(isEnabled: !isEnabled),
        );
      }
    });
  }
}
