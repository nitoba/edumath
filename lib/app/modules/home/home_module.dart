import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/get_general_metrics.dart';
import 'data/repositories/home_repository.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/get_user_general_metrics.dart';
import 'ui/controllers/home_controller.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        $GetUserGeneralMetrics,
        $HomeRepository,
        $GetGereneralMetricsFirestore
        //Bind((i) => HomeController(i<IGetUserGeneralMetrics>())),
        //Bind<IGetUserGeneralMetrics>(
        //  (i) => GetUserGeneralMetrics(i<IHomeRepository>())),
        //Bind<IHomeRepository>(
        //    (i) => HomeRepository(i<IGetGeneralMetricsFirestore>())),
        //Bind<IGetGeneralMetricsFirestore>(
        //   (i) => GetGereneralMetricsFirestore()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => HomePage(user: args.data),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
