import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/app/modules/hooks/pages/home_page.dart';

class HooksModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage()),
      ];
}
