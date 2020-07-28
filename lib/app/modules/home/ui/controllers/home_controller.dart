import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/general_user_metrics_entity.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_user_general_metrics.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetUserGeneralMetrics getUserGeneralMetrics;
  final IGetCategories getCategories;
  _HomeControllerBase(this.getUserGeneralMetrics, this.getCategories);

  @observable
  GeneralUserMetricsEntity generalUserMetricsEntity;

  @observable
  List<CategoriesEntity> categories;

  @action
  getUserMetrics(String userId) async {
    generalUserMetricsEntity = await getUserGeneralMetrics(userId);
  }

  @action
  getAllCagetories() async {
    categories = await getCategories();
  }
}
