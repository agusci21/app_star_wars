import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/extensions/string_helpers.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/custom_expansion_panel.dart';
import 'package:desafio_flutter_urbetrack/core/widgets/millennium_falcon_loading_indicator.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/vehicle_card/bloc/vehicle_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleCard extends StatelessWidget {
  final String vehicleUrl;
  final VehicleCardBloc bloc;
  const VehicleCard({
    required this.vehicleUrl,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? id = vehicleUrl.getIdFromUrl('vehicles');
    const expansionPanelTextStyle = TextStyle(fontSize: 17);

    if (id == null) {
      return const SizedBox();
    }
    return BlocBuilder<VehicleCardBloc, VehicleCardState>(
      bloc: bloc
        ..add(
          LoadVehicle(id: id),
        ),
      builder: (context, state) {
        if (state is Loaded) {
          return CustomExpansionPanel(
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
          child: MillenniumFalconLoadingIndicator(),
        );
      },
    );
  }
}
