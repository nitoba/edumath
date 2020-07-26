import 'package:edumath/app/modules/profile/domain/entities/user_metric_entity.dart';
import 'package:edumath/app/modules/profile/domain/usecases/get_user_metrics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final IGetUserMetrics getUserMetrics;

  @observable
  List<UserMetricEntity> userMetrics;

  _ProfileControllerBase(this.getUserMetrics);

  @action
  Future<void> getUserMetricsMethod(String userId) async {
    userMetrics = await getUserMetrics(userId);
  }
}
