import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:edumath/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:edumath/app/modules/home/domain/usecases/get_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  IHomeRepository repository;
  IGetCategories getCategories;
  setUp(() {
    repository = HomeRepositoryMock();
    getCategories = GetCategories(repository);
  });

  test('should be return a list of categories on database', () async {
    final List<CategoriesEntity> categories = [
      CategoriesEntity(id: "asdasd", title: "Trigonometria"),
      CategoriesEntity(id: "asdasd", title: "Geometria"),
      CategoriesEntity(id: "asdasd", title: "Probabilidade"),
      CategoriesEntity(id: "asdasd", title: "Estatística"),
    ];
    when(repository.getCategories()).thenAnswer((_) async => categories);

    final result = await getCategories();

    expect(result, isA<List<CategoriesEntity>>());
    expect(result.length, 4);
    verify(repository.getCategories());
  });
}
