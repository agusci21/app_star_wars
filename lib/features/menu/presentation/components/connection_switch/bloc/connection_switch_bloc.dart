import 'package:desafio_flutter_urbetrack/infrastructure/persistent_storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_switch_event.dart';
part 'connection_switch_state.dart';

class ConnectionSwitchBloc
    extends Bloc<ConnectionSwitchEvent, ConnectionSwitchState> {
  ConnectionSwitchBloc() : super(Initial()) {
    on<LoadConnection>((event, emit) async {
      final isEnabled = await PersistentStorageHelper.instance.getBool('is_connected');
      emit(Loaded(isEnabled: isEnabled ?? false));
    });

    on<ToggleConnection>((event, emit) async {
      if (state is Loaded) {
        final bool isEnabled = (state as Loaded).isEnabled;
        emit(
          Loaded(isEnabled: !isEnabled),
        );
        await PersistentStorageHelper.instance.setBool('is_connected', !isEnabled);
      }
    });
  }
}
