import '../../domain/entities/general_user_metrics_entity.dart';
import 'package:meta/meta.dart';

class GeneralUserMetricsModel extends GeneralUserMetricsEntity {
  GeneralUserMetricsModel({@required correctAnwers, @required incorrectAnwers})
      : super(
          correctAnwers: correctAnwers,
          incorrectAnwers: incorrectAnwers,
        );

  factory GeneralUserMetricsModel.fromJson(Map<String, dynamic> json) {
    return GeneralUserMetricsModel(
      correctAnwers: json['correctanwers'],
      incorrectAnwers: json['incorrectanwers'],
    );
  }
}
