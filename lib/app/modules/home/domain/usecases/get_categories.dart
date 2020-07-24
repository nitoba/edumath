import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:edumath/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
part 'get_categories.g.dart';

abstract class IGetCategories {
  Future<List<CategoriesEntity>> call();
}

@Injectable()
class GetCategories implements IGetCategories {
  final IHomeRepository repository;

  GetCategories(this.repository);

  @override
  Future<List<CategoriesEntity>> call() async {
    return await repository.getCategories();
  }
}
