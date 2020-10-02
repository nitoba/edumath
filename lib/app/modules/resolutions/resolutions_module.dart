import 'domain/usecases/url_to_videoid.dart';
import 'ui/controllers/resolutions_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ui/pages/resolutions_page.dart';

class ResolutionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ResolutionsController,
        $UrlToVideoId,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ResolutionsPage(questions: args.data)),
      ];

  static Inject get to => Inject<ResolutionsModule>.of();
}
