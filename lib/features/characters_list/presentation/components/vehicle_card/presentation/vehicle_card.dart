import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
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
      bloc: bloc..add(LoadVehicle(id: vehicleId)),
      builder: (context, state) {
        if (state is Loaded) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                bloc.add(PannelPressed());
              },
              children: [
                ExpansionPanel(
                  isExpanded: state.isExpanded,
                  headerBuilder: (context, isExpanded) => Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      state.vehicle.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  body: Container(
                    margin: const EdgeInsets.only(left: 8, bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
