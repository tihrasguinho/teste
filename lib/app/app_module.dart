import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/app_page.dart';
import 'package:test/app/modules/drawer/drawer_module.dart';
import 'package:test/app/modules/hooks/hooks_module.dart';
import 'package:test/app/modules/notifiers/notifiers_module.dart';
import 'package:test/app/modules/resposive/responsive_module.dart';
import 'package:test/app/modules/web/web_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => AppPage()),
    ModuleRoute('/drawer', module: DrawerModule()),
    ModuleRoute('/responsive', module: ResponsiveModule()),
    ModuleRoute('/notifiers', module: NotifiersModule()),
    ModuleRoute('/hooks', module: HooksModule()),
    ModuleRoute('/web', module: WebModule()),
  ];
}
