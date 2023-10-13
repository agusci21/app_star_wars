import 'package:desafio_flutter_urbetrack/abstractions/navigation_helper.dart';
import 'package:flutter/material.dart';

class NavigationHelperImplementation implements NavigationHelper {
  final BuildContext _context;
  NavigationHelperImplementation(this._context);

  @override
  void pop<T extends Object?>([T? result]) async {
    return Navigator.of(_context).pop();
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String route,
      {Object? arguments}) async {
    return Navigator.of(_context).pushNamed(route, arguments: arguments);
  }
}
