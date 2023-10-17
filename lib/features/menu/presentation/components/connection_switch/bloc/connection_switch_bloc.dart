import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/input_output/set_connection/set_connection_input.dart';
import 'package:desafio_flutter_urbetrack/core/common_repositories/domain/repositories/i_connection_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_switch_event.dart';
part 'connection_switch_state.dart';

class ConnectionSwitchBloc
    extends Bloc<ConnectionSwitchEvent, ConnectionSwitchState> {
  final IConnectionRepository _repository;
  ConnectionSwitchBloc({required IConnectionRepository repository})
      : _repository = repository,
        super(Initial()) {
    on<LoadConnection>((event, emit) async {
      final output = await _repository.getConnection();
      emit(
        Loaded(isEnabled: output.isConnected),
      );
    });

    on<ToggleConnection>((event, emit) async {
      if (state is Loaded) {
        final bool isEnabled = (state as Loaded).isEnabled;
        emit(
          Loaded(isEnabled: !isEnabled),
        );
        final input = SetConnectionInput(value: !isEnabled);
        await _repository.setConnection(input);
      }
    });
  }
}
