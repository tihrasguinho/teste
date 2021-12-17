import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/modules/resposive/pages/main_page.dart';

class ResponsiveModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => MainPage()),
      ];
}
