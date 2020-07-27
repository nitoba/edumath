import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class QuestionsModel extends QuestionEntity {
  QuestionsModel(
      {@required String title,
      @required List<Map<String, dynamic>> anwers,
      @required String linkvideo})
      : super(title: title, anwers: anwers, linkvideo: linkvideo);

  factory QuestionsModel.fromDocument(
          {DocumentSnapshot doc, List<Map<String, dynamic>> anwers}) =>
      QuestionsModel(
        title: doc.data['title'],
        anwers: anwers,
        linkvideo: doc.data['linkvideo'],
      );
}
