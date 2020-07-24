import 'package:edumath/app/modules/home/domain/entities/general_user_metrics_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../login/data/datasource/google_login_firebase.dart';
import '../../domain/usecases/get_user_general_metrics.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetUserGeneralMetrics getUserGeneralMetrics;
  _HomeControllerBase(this.getUserGeneralMetrics);

  @observable
  GeneralUserMetricsEntity generalUserMetricsEntity;

  @action
  getUserMetrics(String userId) async {
    generalUserMetricsEntity = await getUserGeneralMetrics(userId);
  }

  logout() async {
    final login = LoginWithFirebase();
    await login.logout();
    Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
  }
}
