import 'package:edumath/app/modules/home/data/models/general_user_metrics_model.dart';
import 'package:edumath/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  IHomeRepository repository;
  setUp(() {
    repository = HomeRepositoryMock();
  });

  test(
      'should be return instace of GeneralUserMetricsModel with fields null if pass invalid_id',
      () async {
    when(repository.getGeneralUserMetrics('invalid_id')).thenAnswer((_) async =>
        GeneralUserMetricsModel(correctAnwers: null, incorrectAnwers: null));
    final result = await repository.getGeneralUserMetrics('invalid_id');

    expect(result.correctAnwers, null);
    expect(result.incorrectAnwers, null);
  });

  test('should be return instace of GeneralUserMetricsModel if pass valid_id',
      () async {
    when(repository.getGeneralUserMetrics('invalid_id')).thenAnswer((_) async =>
        GeneralUserMetricsModel(correctAnwers: 10, incorrectAnwers: 10));
    final result = await repository.getGeneralUserMetrics('invalid_id');

    expect(result.correctAnwers, 10);
    expect(result.incorrectAnwers, 10);
  });
}
