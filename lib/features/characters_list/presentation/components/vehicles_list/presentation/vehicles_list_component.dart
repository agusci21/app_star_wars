
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicle_card/bloc/vehicle_card_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicle_card/presentation/vehicle_card.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

class VehiclesList extends StatelessWidget {
  final List<String> vehiclesIds;
  const VehiclesList({required this.vehiclesIds, super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(final id in vehiclesIds)
          VehicleCard(vehicleId: id,bloc: IocManager.instance.resolve<VehicleCardBloc>(), )
      ],
    );
  }
}