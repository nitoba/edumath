import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

import '../../domain/entities/user_metric_entity.dart';
import '../../domain/repositories/iprofile_repository.dart';
import '../datasources/get_user_metrics_firestore.dart';
import '../models/user_metrics_model.dart';
part 'profile_repository_imp.g.dart';

@Injectable()
class ProfileRepositoryImp implements IprofileRepository {
  final IGetUserMetricsFirestore getUserMetricsFirestore;

  ProfileRepositoryImp(this.getUserMetricsFirestore);

  @override
  Future<List<UserMetricEntity>> getUserMetrics(String userId) async {
    List<UserMetricEntity> userMetrics = [];

    var userMetricsLoaded =
        await getUserMetricsFirestore.getUserMetrics(userId);

    (userMetricsLoaded['correctanwers'] as Map).forEach(
      (key, valueCorrect) {
        userMetrics.add(
          UserMetricsModel.fromJson(
            categorieName: key,
            correct: valueCorrect,
            incorrect: userMetricsLoaded['incorrectanwers'][key],
          ),
        );
      },
    );

    return userMetrics;
  }
}
