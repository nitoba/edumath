import '../entities/general_user_metrics_entity.dart';
import '../repositories/i_home_repository.dart';

abstract class IGetUserGeneralMetrics {
  Future<GeneralUserMetricsEntity> call(String userID);
}

class GetUserGeneralMetrics implements IGetUserGeneralMetrics {
  final IHomeRepository repository;

  GetUserGeneralMetrics(this.repository);

  @override
  Future<GeneralUserMetricsEntity> call(String userID) async {
    final generalMetricsOfUser = await repository.getGeneralUserMetrics(userID);
    if (generalMetricsOfUser.correctAnwers != null &&
        generalMetricsOfUser.correctAnwers != null) return generalMetricsOfUser;

    return GeneralUserMetricsEntity(correctAnwers: 0, incorrectAnwers: 0);
  }
}
