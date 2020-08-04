import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/score_entity.dart';

part 'save_user_metrics_firestore.g.dart';

abstract class ISaveUserScoreFirestore {
  Future saveScore(ScoreEntity scoreEntity);
}

@Injectable(singleton: false)
class SaveUserScoreFirestoreImpl implements ISaveUserScoreFirestore {
  final Firestore instance;

  SaveUserScoreFirestoreImpl(this.instance);
  @override
  Future saveScore(ScoreEntity scoreModel) async {
    final result = await instance
        .collection('users')
        .where('userId', isEqualTo: scoreModel.userId)
        .getDocuments();

    final correctMap =
        (result.documents.first.data['userMetrics']['correctanwers'] as Map);

    correctMap[scoreModel.categorieName] =
        correctMap[scoreModel.categorieName] + scoreModel.correctScore;

    final inCorrectMap =
        (result.documents.first.data['userMetrics']['incorrectanwers'] as Map);

    inCorrectMap[scoreModel.categorieName] =
        inCorrectMap[scoreModel.categorieName] + scoreModel.incorrectScore;

    await instance
        .collection('users')
        .document(result.documents.first.documentID)
        .updateData({
      "userMetrics": {
        "correctanwers": correctMap,
        "incorrectanwers": inCorrectMap,
      }
    });
  }
}
