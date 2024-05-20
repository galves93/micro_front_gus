import 'package:flutter/material.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_core/app/base_app.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({super.key}) {
    super.registerInjections();
    super.registerRoutes();
  }

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();

    return MaterialApp(
      title: 'Flutter Micro FrontEnd',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigaterKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppLoginResolver(),
      ];
}
