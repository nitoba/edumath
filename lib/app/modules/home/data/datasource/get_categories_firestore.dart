import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/home/data/models/categories_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

part 'get_categories_firestore.g.dart';

abstract class IGetCategoriesFirestore {
  Future<List<CategoriesModel>> getCategories();
}

@Injectable()
class GetCategoriesFirestore implements IGetCategoriesFirestore {
  final Firestore instance = Firestore.instance;
  @override
  Future<List<CategoriesModel>> getCategories() async {
    final categories = await instance.collection('questions').getDocuments();
    return categories.documents
        .map((categorie) => CategoriesModel.fromDocument(categorie))
        .toList();
  }
}
