import 'package:desafio_flutter_urbetrack/abstractions/persistent_storage.dart';
import 'package:desafio_flutter_urbetrack/application/application.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/ioc_manager.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvironmentConfig.init();
  IocManager.register();
  await IocManager.instance.resolve<PersistentStorage>().init();
  runApp(const Application());
}

