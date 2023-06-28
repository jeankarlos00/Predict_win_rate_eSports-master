import 'package:flutter_modular/flutter_modular.dart';
import 'view/page/homepage.dart';
import '../../feature/home/view_model/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
