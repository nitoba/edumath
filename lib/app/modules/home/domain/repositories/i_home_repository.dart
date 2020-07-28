import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';

import '../entities/general_user_metrics_entity.dart';

abstract class IHomeRepository {
  Future<GeneralUserMetricsEntity> getGeneralUserMetrics(String userId);
  Future<List<CategoriesEntity>> getCategories();
}
