import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/challenge/domain/usecases/get_questions.dart';
import 'package:edumath/app/modules/challenge/domain/usecases/next_question.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'challenge_controller.g.dart';

@Injectable()
class ChallengeController = _ChallengeControllerBase with _$ChallengeController;

abstract class _ChallengeControllerBase with Store {
  final IGetQuestions getQuestions;
  final INextQuestion nextQuestionUseCase;

  _ChallengeControllerBase(this.getQuestions, this.nextQuestionUseCase);
  @observable
  int currentQuestion = 0;

  @observable
  ObservableList<QuestionEntity> questions;

  @action
  goToChallenge(String categorieiD) async {
    questions =
        await getQuestions(categorieiD).then((value) => value.asObservable());

    Modular.link.pushReplacementNamed('/challengePage');
  }

  @action
  nextQuestion() {
    currentQuestion = nextQuestionUseCase(
      questionsLenght: questions.length,
      currentQuestion: currentQuestion,
    );
  }
}
