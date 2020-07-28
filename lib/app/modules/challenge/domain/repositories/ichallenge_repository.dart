import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/challenge/domain/entities/score_entity.dart';

abstract class IChallengeRepository {
  Future<List<QuestionEntity>> getQuestions(String categorieId);
  Future saveUserScore(ScoreEntity scoreEntity);
}
