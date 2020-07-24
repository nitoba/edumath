import '../entities/general_user_metrics_entity.dart';

abstract class IHomeRepository {
  Future<GeneralUserMetricsEntity> getGeneralUserMetrics(String userId);
}
