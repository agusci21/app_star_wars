
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvironmentConfig {

  static Future<void> init() async {
    await dotenv.load();
  }
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get defaultLanguage => dotenv.env['DEFAULT_LANGUAGE'] ?? '';
  static String get reportCharacterUrl => dotenv.env['REPORT_CHARACTER_URL'] ?? '';
}