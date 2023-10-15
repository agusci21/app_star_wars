
import 'package:flutter/material.dart';

abstract class INavigation {
  Future<T?> pushNamed<T extends Object?>(BuildContext context, String routeName,
      {Object? arguments});
  void pop<T extends Object?>(BuildContext context, [T? result]);
}
