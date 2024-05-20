import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

import 'page/login_page.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {'/login': (context, args) => const LoginPage()};

  @override
  // TODO: implement injectionRegister
  void Function() get injectionRegister => throw UnimplementedError();
}
