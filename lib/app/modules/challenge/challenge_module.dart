import 'package:flutter_modular/flutter_modular.dart';

import 'ui/controllers/challenge_controller.dart';
import 'ui/pages/challenge_page.dart';
import 'ui/pages/prepare_challenge_page.dart';

class ChallengeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChallengeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/:title',
            child: (_, args) => PrepareChallengePage(
                  title: args.params['title'],
                )),
        Router(
          '/challengePage',
          child: (_, args) => ChallengePage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<ChallengeModule>.of();
}
