import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';

abstract class GetIdsFromListHelper {
  static List<String> getIdsFromVehicles(List<String> list) {
    return list
        .map((e) => e
            .replaceAll(EnvironmentConfig.baseUrl, '')
            .replaceAll('vehicles', '')
            .replaceAll('/', ''))
        .toList();
  }

  static List<String> getIdsFromStarships(List<String> list) {
    return list
        .map((e) => e
            .replaceAll(EnvironmentConfig.baseUrl, '')
            .replaceAll('starships', '')
            .replaceAll('/', ''))
        .toList();
  }
}
