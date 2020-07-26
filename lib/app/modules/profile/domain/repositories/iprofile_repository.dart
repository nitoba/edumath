import 'package:edumath/app/modules/profile/domain/entities/user_metric_entity.dart';

abstract class IprofileRepository {
  Future<List<UserMetricEntity>> getUserMetrics(String userId);
}
