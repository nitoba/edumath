import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/challenge/data/models/questions_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
part 'get_questions_firestore.g.dart';

abstract class IGetQuestionsFirestore {
  Future<List<QuestionsModel>> getQuestionsOnFirestore(String categorieId);
}

@Injectable()
class GetQuestionsFirestore implements IGetQuestionsFirestore {
  final Firestore instance;

  GetQuestionsFirestore(this.instance);
  @override
  Future<List<QuestionsModel>> getQuestionsOnFirestore(
      String categorieId) async {
    final result = await instance
        .collection('questions')
        .document(categorieId)
        .collection('questions')
        .getDocuments();

    final questions = result.documents.map((question) {
      List<Map<String, dynamic>> anwers = [];
      anwers.add({'anwer1': question.data['anwer1']});
      anwers.add({'anwer2': question.data['anwer2']});
      anwers.add({'anwer3': question.data['anwer3']});
      anwers.add({'correct': question.data['correct']});
      anwers.shuffle();
      return QuestionsModel.fromDocument(doc: question, anwers: anwers);
    }).toList();

    return questions;
  }
}
