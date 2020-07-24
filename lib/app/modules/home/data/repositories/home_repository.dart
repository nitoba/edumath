import 'package:edumath/app/modules/home/data/datasource/get_categories_firestore.dart';
import 'package:edumath/app/modules/home/data/datasource/get_general_metrics.dart';
import 'package:edumath/app/modules/home/data/models/general_user_metrics_model.dart';
import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

import '../../domain/entities/general_user_metrics_entity.dart';
import '../../domain/repositories/i_home_repository.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository implements IHomeRepository {
  final IGetGeneralMetricsFirestore generalMetricsFirestore;
  final IGetCategoriesFirestore getCategoriesFirestore;

  HomeRepository(this.generalMetricsFirestore, this.getCategoriesFirestore);
  @override
  Future<GeneralUserMetricsEntity> getGeneralUserMetrics(String userId) async {
    final userMetrics =
        await generalMetricsFirestore.getGeneralMetricsOfUser(userId);

    if (userMetrics.isNotEmpty)
      return GeneralUserMetricsModel.fromDocument(userMetrics.first);

    return GeneralUserMetricsModel(correctAnwers: null, incorrectAnwers: null);
  }

  @override
  Future<List<CategoriesEntity>> getCategories() async {
    return await getCategoriesFirestore.getCategories();
  }
}
