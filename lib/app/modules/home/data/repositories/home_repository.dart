import 'package:edumath/app/modules/home/data/datasource/get_general_metrics.dart';
import 'package:edumath/app/modules/home/data/models/general_user_metrics_model.dart';

import '../../domain/entities/general_user_metrics_entity.dart';
import '../../domain/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final IGetGeneralMetricsFirestore generalMetricsFirestore;

  HomeRepository(this.generalMetricsFirestore);
  @override
  Future<GeneralUserMetricsEntity> getGeneralUserMetrics(String userId) async {
    final userMetrics =
        await generalMetricsFirestore.getGeneralMetricsOfUser(userId);

    if (userMetrics.isNotEmpty)
      return GeneralUserMetricsModel.fromDocument(userMetrics.first);

    return GeneralUserMetricsModel(correctAnwers: null, incorrectAnwers: null);
  }
}
