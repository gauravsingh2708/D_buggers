import 'package:d_bugger/Page/location.dart';
import 'package:d_bugger/main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/Location':
        return MaterialPageRoute(builder: (_) => Location());
    }
  }
}
