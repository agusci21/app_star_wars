import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicle_card/bloc/vehicle_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleCard extends StatelessWidget {
  final String vehicleId;
  final VehicleCardBloc bloc;
  const VehicleCard({
    required this.vehicleId,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleCardBloc, VehicleCardState>(
      bloc: bloc..add(LoadVehicle(id: vehicleId)),
      builder: (context, state) {
        if (state is Loaded) {
          return DropdownButton(
            onChanged: (value) {},
            items: const [
              DropdownMenuItem(
                child: Text('A'),
              )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
