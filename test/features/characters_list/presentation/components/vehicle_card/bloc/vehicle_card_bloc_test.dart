import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_flutter_urbetrack/core/entities/vehicle.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_output.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_vehicle_repository.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicle_card/bloc/vehicle_card_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'vehicle_card_bloc_test.mocks.dart';

@GenerateMocks([IVehicleRepository])
void main() {
  final repository = MockIVehicleRepository();
  final loadVehicleEvent = LoadVehicle(id: '1');
  group(
    'Test to Vehicle card bloc',
    () {
      blocTest<VehicleCardBloc, VehicleCardState>(
        'will test a successful petition and shouldAnswer [Loaded]',
        build: () {
      final output = GetVehicleByIdOutput.withData(
        const Vehicle(
          costInCredits: 'test',
          manufacturer: 'test',
          name: 'test',
          vehicleClass: 'test',
        ),
      );
          when(repository.getVehicleById(any)).thenAnswer((_) async => output);
          return VehicleCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadVehicleEvent),
        expect: () => [isA<Loaded>()],
      );
      blocTest<VehicleCardBloc, VehicleCardState>(
        'will test a failed petition and shouldAnswer [Failed]',
        build: () {
          final output = GetVehicleByIdOutput.withError('some_test_error');
          when(repository.getVehicleById(any)).thenAnswer((_) async => output);
          return VehicleCardBloc(repository: repository);
        },
        act: (bloc) => bloc.add(loadVehicleEvent),
        expect: () => [isA<Failed>()],
      );
    },
  );
}