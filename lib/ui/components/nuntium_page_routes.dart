import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NuntiumPageRoutes {
  const NuntiumPageRoutes._();

  static Route defaultRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static Route material(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static Route cupertino(Widget page) {
    return CupertinoPageRoute(builder: (context) => page);
  }
}
