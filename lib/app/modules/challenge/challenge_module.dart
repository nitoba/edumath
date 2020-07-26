import 'challenge_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'challenge_page.dart';

class ChallengeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChallengeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChallengePage()),
      ];

  static Inject get to => Inject<ChallengeModule>.of();
}
