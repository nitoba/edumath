import 'package:edumath/app/modules/home/domain/entities/general_user_metrics_entity.dart';
import 'package:edumath/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:edumath/app/modules/home/domain/usecases/get_user_general_metrics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  IHomeRepository repository;
  IGetUserGeneralMetrics usecase;
  setUp(() {
    repository = HomeRepositoryMock();
    usecase = GetUserGeneralMetrics(repository);
  });

  test('should return general metrics of user if he have some metrics',
      () async {
    final userGeneralMetrics = GeneralUserMetricsEntity(
      correctAnwers: 5,
      incorrectAnwers: 2,
    );
    when(repository.getGeneralUserMetrics("valid_userId"))
        .thenAnswer((_) async => userGeneralMetrics);

    final result = await usecase("valid_userId");

    expect(result, userGeneralMetrics);
    verify(repository.getGeneralUserMetrics("valid_userId"));
  });

  test('should return general metrics of user with "0" if user no has metrics',
      () async {
    when(repository.getGeneralUserMetrics("valid_userId"))
        .thenAnswer((_) async => GeneralUserMetricsEntity());

    final result = await usecase("valid_userId");

    expect(result.correctAnwers, 0);
    expect(result.incorrectAnwers, 0);
    verify(repository.getGeneralUserMetrics("valid_userId"));
  });
}
