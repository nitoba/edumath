import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/general_user_metrics_entity.dart';
import 'package:meta/meta.dart';

class GeneralUserMetricsModel extends GeneralUserMetricsEntity {
  GeneralUserMetricsModel({@required correctAnwers, @required incorrectAnwers})
      : super(
          correctAnwers: correctAnwers,
          incorrectAnwers: incorrectAnwers,
        );

  factory GeneralUserMetricsModel.fromDocument(DocumentSnapshot doc) {
    return GeneralUserMetricsModel(
      correctAnwers: doc.data['userMetrics']['correctanwers'],
      incorrectAnwers: doc.data['userMetrics']['incorrectanwers'],
    );
  }
}
