import 'package:edumath/app/modules/challenge/data/datasource/get_questions_firestore.dart';
import 'package:edumath/app/modules/challenge/data/datasource/save_user_metrics_firestore.dart';
import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/challenge/domain/entities/score_entity.dart';
import 'package:edumath/app/modules/challenge/domain/repositories/ichallenge_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
part 'challenge_repository_impl.g.dart';

@Injectable()
class ChallengeRepositoryImpl implements IChallengeRepository {
  final IGetQuestionsFirestore getQuestionsFirestore;
  final ISaveUserScoreFirestore saveUserScoreFirestore;

  ChallengeRepositoryImpl(
      this.getQuestionsFirestore, this.saveUserScoreFirestore);
  @override
  Future<List<QuestionEntity>> getQuestions(String categorieId) async {
    return await getQuestionsFirestore.getQuestionsOnFirestore(categorieId);
  }

  @override
  Future saveUserScore(ScoreEntity scoreEntity) async {
    await saveUserScoreFirestore.saveScore(scoreEntity);
  }
}
