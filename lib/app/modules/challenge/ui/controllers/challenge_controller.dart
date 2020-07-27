import 'package:edumath/app/modules/challenge/domain/usecases/get_questions.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'challenge_controller.g.dart';

@Injectable()
class ChallengeController = _ChallengeControllerBase with _$ChallengeController;

abstract class _ChallengeControllerBase with Store {
  final IGetQuestions getQuestions;

  _ChallengeControllerBase(this.getQuestions);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  goToChallenge(String categorieiD) async {
    await getQuestions(categorieiD);
    Modular.link.pushReplacementNamed('/challengePage');
  }
}
