import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/dfu_expansion_panel.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/dfu_millennium_falcon_loading_indicator.dart';
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
    const expansionPanelTextStyle = TextStyle(fontSize: 17);
    return BlocBuilder<VehicleCardBloc, VehicleCardState>(
      bloc: bloc..add(LoadVehicle(id: vehicleId.getIdFromUrl('vehicles') ?? ''),),
      builder: (context, state) {
        if (state is Loaded) {
          return DFUExpansionPanel(
            expansionCallback: (panelIndex, isExpanded) {
              bloc.add(PannelPressed());
            },
            isExpanded: state.isExpanded,
            title: state.vehicle.name,
            content: [
              Text(
                '${I18n.of(context).translate('vehicle_class')}: ${state.vehicle.vehicleClass}',
                style: expansionPanelTextStyle,
              ),
              Text(
                '${I18n.of(context).translate('manufacturer')}: ${state.vehicle.manufacturer}',
                style: expansionPanelTextStyle,
              ),
              Text(
                '${I18n.of(context).translate('cost')}: ${state.vehicle.costInCredits}',
                style: expansionPanelTextStyle,
              ),
            ],
          );
        }
        return const Center(
          child: DFUMillenniumFalcon(),
        );
      },
    );
  }
}
