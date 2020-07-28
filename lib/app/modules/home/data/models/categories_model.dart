import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:meta/meta.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({@required String id, @required String title})
      : super(id: id, title: title);

  factory CategoriesModel.fromDocument(DocumentSnapshot doc) {
    return CategoriesModel(
      id: doc.documentID,
      title: doc.data['title'],
    );
  }
}
