import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/modules/web/pages/main_page.dart';

class WebModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => MainPage()),
      ];
}
