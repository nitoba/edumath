import 'package:flutter_modular/flutter_modular.dart';
part 'next_question.g.dart';

abstract class INextQuestion {
  int call({int questionsLenght, int currentQuestion});
}

@Injectable(singleton: false)
class NextQuestion implements INextQuestion {
  @override
  int call({int questionsLenght, int currentQuestion}) {
    if (currentQuestion < (questionsLenght - 1)) currentQuestion++;
    return currentQuestion;
  }
}
