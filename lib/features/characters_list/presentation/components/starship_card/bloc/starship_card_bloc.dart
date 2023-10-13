import 'package:desafio_flutter_urbetrack/core/entities/starship.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_starships_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'starship_card_event.dart';
part 'starship_card_state.dart';

class StarshipCardBloc extends Bloc<StarshipCardEvent, StarshipCardState> {
  final IStarshipRepository _repository;
  StarshipCardBloc({
    required IStarshipRepository repository,
  })  : _repository = repository,
        super(Initial()) {
    on<LoadStarship>(
      (event, emit) async {
        final input = GetStarshipByIdInput(id: event.id);
        final output = await _repository.getStarshipById(input);
        if (output.hasError) {
          emit(Failed());
          return;
        }
        emit(
          Loaded(starship: output.starship!, isExpanded: false),
        );
      },
    );

    on<PanelPressed>(
      (event, emit) {
        if (state is Loaded) {
          emit(
            Loaded(
                starship: (state as Loaded).starship,
                isExpanded: !(state as Loaded).isExpanded),
          );
        }
      },
    );
  }
}
