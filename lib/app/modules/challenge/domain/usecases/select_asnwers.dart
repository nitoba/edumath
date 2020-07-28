import 'package:flutter_modular/flutter_modular.dart';

part 'select_asnwers.g.dart';

abstract class ISelectAsnwers {
  bool call(Map<String, dynamic> isRigth);
  bool isOver({int questionsLenght, int currentQuestion, bool wasAnswered});
}

@Injectable(singleton: false)
class SelectAsnwers implements ISelectAsnwers {
  int _scoreCorrect = 0;
  int _scoreIncorrect = 0;
  @override
  bool call(Map<String, dynamic> isRigth) {
    if (isRigth['isRight']) {
      _scoreCorrect++;
      return true;
    } else {
      _scoreIncorrect++;
      return false;
    }
  }

  @override
  bool isOver({int questionsLenght, int currentQuestion, bool wasAnswered}) {
    return (currentQuestion == (questionsLenght - 1)) && wasAnswered
        ? true
        : false;
  }
}
