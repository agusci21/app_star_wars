import 'package:desafio_flutter_urbetrack/application/application.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  await EnvironmentConfig.init();
  IocManager.register();
  runApp(const Application());
}

