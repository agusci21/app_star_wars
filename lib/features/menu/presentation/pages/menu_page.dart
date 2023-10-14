
import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/components/connection_switch/bloc/connection_switch_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/menu/presentation/components/connection_switch/presentation/connection_switch.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(I18n.of(context).translate('menu')),
      ),
      body: ConnectionSwitch(
        bloc: IocManager.instance.resolve<ConnectionSwitchBloc>(),
      ),
    );
  }
}