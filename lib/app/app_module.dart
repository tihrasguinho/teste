import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/app_page.dart';
import 'package:test/app/modules/drawer/drawer_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => AppPage()),
    ModuleRoute('/drawer', module: DrawerModule()),
  ];
}
