import 'package:flutter_modular/flutter_modular.dart';

import 'ui/controllers/profile_controller.dart';
import 'ui/pages/profile_page.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ProfilePage(user: args.data),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
