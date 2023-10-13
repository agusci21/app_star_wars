import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';

extension StringHelper on String {
  String? getIdFromPlanetUrl() {
    if (!startsWith(EnvironmentConfig.baseUrl)) {
      return null;
    }
    return replaceAll(EnvironmentConfig.baseUrl, '')
        .replaceAll('/', '')
        .replaceAll('planets', '');
  }
}
