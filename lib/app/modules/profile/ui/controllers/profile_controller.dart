import 'package:edumath/app/core/constants.dart';
import 'package:edumath/app/modules/profile/domain/entities/user_metric_entity.dart';
import 'package:edumath/app/modules/profile/domain/usecases/get_user_metrics.dart';
import 'package:edumath/app/modules/profile/domain/usecases/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mobx/mobx.dart';

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
    showDialog(
      context: context,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: insaturationPurple,
        title: Text(
          "Logout",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Tem certeza que deseja sair ?",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FlatButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Feather.x_circle,
              color: Colors.white,
            ),
            label: Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton.icon(
            onPressed: () async {
              await logout.logout();
              Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
            },
            icon: Icon(
              Feather.log_out,
              color: Colors.white,
            ),
            label: Text(
              "Sair",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
