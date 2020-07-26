import 'package:edumath/app/modules/profile/domain/entities/user_metric_entity.dart';

class UserMetricsModel extends UserMetricEntity {
  UserMetricsModel({
    String categorieName,
    int correctanwers,
    int incorrectanwers,
  }) : super(
          categorieName: categorieName,
          correctanwers: correctanwers,
          incorrectanwers: incorrectanwers,
        );

  factory UserMetricsModel.fromJson(
          {int correct, int incorrect, String categorieName}) =>
      UserMetricsModel(
        categorieName: categorieName,
        correctanwers: correct,
        incorrectanwers: incorrect,
      );
}
