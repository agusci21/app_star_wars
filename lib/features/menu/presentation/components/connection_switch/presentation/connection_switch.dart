// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/components/connection_switch/bloc/connection_switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionSwitch extends StatelessWidget {
  final ConnectionSwitchBloc bloc;
  const ConnectionSwitch({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionSwitchBloc, ConnectionSwitchState>(
      bloc: bloc..add(LoadConnection()),
      builder: (context, state) {
        if (state is Loaded) {
          return Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
            width: double.infinity,
            child: SwitchListTile(
              activeColor: getRandomColorOfYediSaber(),
              title: Text(
                I18n.of(context).translate(
                  state.isEnabled
                      ? 'desactivate_connection'
                      : 'activate_connection',
                ),
                style: TextStyle(fontSize: 24),
              ),
              value: state.isEnabled,
              onChanged: (value) => bloc.add(ToggleConnection()),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Color getRandomColorOfYediSaber() {
    final number = Random().nextDouble();

    if (number < 0.4) {
      return Colors.blue;
    } else if (number < 0.8) {
      return Colors.green;
    }
    return Colors.pink;
  }
}
