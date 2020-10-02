import 'package:edumath/app/modules/challenge/ui/pages/challenge_sucess_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/get_questions_firestore.dart';

import 'data/datasource/save_user_metrics_firestore.dart';
import 'data/repositories/challenge_repository_impl.dart';
import 'domain/usecases/get_questions.dart';
import 'domain/usecases/next_question.dart';
import 'domain/usecases/save_user_score.dart';
import 'domain/usecases/select_asnwers.dart';
import 'ui/controllers/challenge_controller.dart';
import 'ui/pages/challenge_page.dart';
import 'ui/pages/prepare_challenge_page.dart';

class ChallengeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ChallengeController,
        $GetQuestions,
        $NextQuestion,
        $SelectAsnwers,
        $SaveUserScore,
        $ChallengeRepositoryImpl,
        $GetQuestionsFirestore,
        $SaveUserScoreFirestoreImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PrepareChallengePage(
                categorie: args.data[0], userId: args.data[1])),
        ModularRouter(
          '/challengePage',
          child: (_, args) => ChallengePage(),
          transition: TransitionType.rightToLeft,
        ),
        ModularRouter(
          '/sucessPage',
          child: (_, args) => SucessPage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<ChallengeModule>.of();
}
