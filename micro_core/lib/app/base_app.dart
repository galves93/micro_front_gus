import 'package:flutter/material.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

mixin BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    String? routerName = settings.name;
    Object? routerArgs = settings.arguments;

    WidgetBuilderArgs? navigateTo = routes[routerName];
    if (navigateTo == null) {
      return null;
    }

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs ?? ''),
    );
  }

  void registerInjections() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.injectionRegister();
      }
    }
  }
}
