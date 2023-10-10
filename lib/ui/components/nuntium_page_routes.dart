import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class NuntiumPageRoutes {
  const NuntiumPageRoutes();

  static Route<T> defaultRoute<T>(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static Route<T> material<T>(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static Route<T> cupertino<T>(Widget page) {
    return CupertinoPageRoute(builder: (context) => page);
  }
}
