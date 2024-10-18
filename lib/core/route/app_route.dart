import 'package:filenominatool/core/route/app_route_name.dart';
import 'package:filenominatool/wrapper.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
            builder: (_) => const Wrapper(), settings: settings);
    }
    return null;
  }
}
