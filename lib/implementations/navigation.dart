import 'package:desafio_flutter_urbetrack/abstractions/i_navigation.dart';
import 'package:flutter/material.dart';

class Navigation implements INavigation {

  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) async {
    return Navigator.pop(context);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(BuildContext context, String route,
      {Object? arguments}) async {
    return Navigator.pushNamed(context, route, arguments: arguments);
  }
}
