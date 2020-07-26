import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

import '../entities/user_metric_entity.dart';
import '../repositories/iprofile_repository.dart';
part 'get_user_metrics.g.dart';

abstract class IGetUserMetrics {
  Future<List<UserMetricEntity>> call(String userId);
}

@Injectable(singleton: false)
class GetUserMetrics implements IGetUserMetrics {
  final IprofileRepository repository;

  GetUserMetrics(this.repository);
  @override
  Future<List<UserMetricEntity>> call(String userId) async {
    return await repository.getUserMetrics(userId);
  }
}
