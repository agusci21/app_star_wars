import 'package:desafio_flutter_urbetrack/core/entities/planet.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_planet_by_id/get_planet_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_planets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planet_card_event.dart';
part 'planet_card_state.dart';

class PlanetCardBloc extends Bloc<PlanetCardEvent, PlanetCardState> {
  final IPlanetsRepository _repository;
  PlanetCardBloc({
    required IPlanetsRepository repository,
  })  : _repository = repository,
        super(Initial()) {
    on<LoadPlanet>((event, emit) async {
      final input = GetPlanetByIdInput(id: event.id);
      final output = await _repository.getPlanetById(input);
      if (output.hasError) {
        emit(Failed());
        return;
      }
      emit(
        Loaded(planet: output.planet!, isExpanded: false),
      );
    });

    on<PanelPressed>(
      (event, emit) {
        if (state is Loaded) {
          emit(
            Loaded(
                isExpanded: !(state as Loaded).isExpanded,
                planet: (state as Loaded).planet),
          );
        }
      },
    );
  }
}
