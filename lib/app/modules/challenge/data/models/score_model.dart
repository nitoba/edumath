import 'package:edumath/app/modules/challenge/domain/entities/score_entity.dart';

class ScoreModel extends ScoreEntity {
  ScoreModel(
      {int correctScore,
      int incorrectScore,
      String userId,
      String categorieName})
      : super(
          correctScore: correctScore,
          incorrectScore: incorrectScore,
          userId: userId,
          categorieName: categorieName,
        );
}
