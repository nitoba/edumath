import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

import '../entities/general_user_metrics_entity.dart';
import '../repositories/i_home_repository.dart';
part 'get_user_general_metrics.g.dart';

abstract class IGetUserGeneralMetrics {
  Future<GeneralUserMetricsEntity> call(String userID);
}

@Injectable()
class GetUserGeneralMetrics implements IGetUserGeneralMetrics {
  final IHomeRepository repository;

  GetUserGeneralMetrics(this.repository);

  @override
  Future<GeneralUserMetricsEntity> call(String userID) async {
    final generalMetricsOfUser = await repository.getGeneralUserMetrics(userID);
    if (generalMetricsOfUser.correctAnwers != null &&
        generalMetricsOfUser.correctAnwers != null) return generalMetricsOfUser;

    return GeneralUserMetricsEntity(correctAnwers: 0, incorrectAnwers: 0);
  }
}
