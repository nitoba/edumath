import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/utils/dialogs.dart';
import '../../domain/entities/user_metric_entity.dart';
import '../../domain/usecases/get_user_metrics.dart';
import '../../domain/usecases/logout.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final IGetUserMetrics getUserMetrics;
  final ILogout logout;

  @observable
  List<UserMetricEntity> userMetrics;

  _ProfileControllerBase(this.getUserMetrics, this.logout);

  @action
  Future<void> getUserMetricsMethod(String userId) async {
    userMetrics = await getUserMetrics(userId);
  }

  handleLogout(BuildContext context) {
    showOneDialog(context, section: "Logout", onPressed: () async {
      await logout.logout();
      Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
    });
  }
}
