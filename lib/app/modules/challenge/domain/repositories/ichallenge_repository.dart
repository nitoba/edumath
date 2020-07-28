import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';

abstract class IChallengeRepository {
  Future<List<QuestionEntity>> getQuestions(String categorieId);
}
