import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/get_questions_firestore.dart';

import 'data/repositories/challenge_repository_impl.dart';
import 'domain/usecases/get_questions.dart';
import 'ui/controllers/challenge_controller.dart';
import 'ui/pages/challenge_page.dart';
import 'ui/pages/prepare_challenge_page.dart';

class ChallengeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ChallengeController,
        $GetQuestions,
        $ChallengeRepositoryImpl,
        $GetQuestionsFirestore,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => PrepareChallengePage(categorie: args.data)),
        Router(
          '/challengePage',
          child: (_, args) => ChallengePage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<ChallengeModule>.of();
}
