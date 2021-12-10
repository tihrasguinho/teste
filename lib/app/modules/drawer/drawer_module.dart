import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/modules/drawer/helpers/notification_config.dart';
import 'package:test/app/modules/drawer/pages/home_page.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => NotificationConfig()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage()),
      ];
}
