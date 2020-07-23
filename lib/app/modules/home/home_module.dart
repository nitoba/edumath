import 'package:flutter_modular/flutter_modular.dart';

import 'ui/controllers/home_controller.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => HomePage(user: args.data),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
