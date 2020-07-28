import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/get_user_metrics_firestore.dart';
import 'data/repositories/profile_repository_imp.dart';
import 'domain/usecases/get_user_metrics.dart';
import 'domain/usecases/logout.dart';
import 'ui/controllers/profile_controller.dart';
import 'ui/pages/how_to_work_page.dart';
import 'ui/pages/profile_page.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProfileController,
        $GetUserMetrics,
        $Logout,
        $ProfileRepositoryImp,
        $GetUserMetricsFirestore,
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ProfilePage(user: args.data),
          transition: TransitionType.rightToLeft,
        ),
        Router(
          "/howtowork",
          child: (_, args) => HowToWorkPage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
