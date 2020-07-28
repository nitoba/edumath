import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:edumath/app/modules/home/data/models/categories_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FirestoreMock {
  final _instance = MockFirestoreInstance();

  addCategories(String title) async {
    await _instance.collection('questions').add({'title': title});
  }

  Future<List<DocumentSnapshot>> getCategories() async {
    final categories = await _instance.collection('questions').getDocuments();
    return categories.documents;
  }
}

void main() {
  FirestoreMock firestoreMock;
  setUp(() {
    firestoreMock = FirestoreMock();
  });

  test(
      'should be return a instance of Categorie Model of list categories on firebase',
      () async {
    await firestoreMock.addCategories('Trigonometria');
    await firestoreMock.addCategories('Geometria');
    await firestoreMock.addCategories('Estatistica');

    final result = await firestoreMock.getCategories();

    final categoriesParsed = CategoriesModel.fromDocument(result[0]);

    expect(categoriesParsed, isA<CategoriesModel>());
    expect(categoriesParsed.id, result[0].documentID);
    expect(categoriesParsed.title, result[0].data['title']);
  });
}
