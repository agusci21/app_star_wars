
import 'package:desafio_flutter_urbetrack/implementations/navigation_helper_implementation.dart';
import 'package:flutter/material.dart';

abstract class NavigationHelper {
  Future<T?> pushNamed<T extends Object?>(String route);
  void pop<T extends Object?>([T? result]);

  static NavigationHelperImplementation of(BuildContext context) {
    return NavigationHelperImplementation(context);
  }
}