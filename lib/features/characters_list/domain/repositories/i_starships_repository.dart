
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_input.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_starship_by_id/get_starship_by_id_output.dart';

abstract class IStarshipRepository {
  Future<GetStarshipByIdOutput> getStarshipById(GetStarshipByIdInput input);
}