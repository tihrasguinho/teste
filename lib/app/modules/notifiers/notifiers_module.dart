import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/modules/notifiers/pages/main_page.dart';

class NotifiersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => MainPage()),
      ];
}
