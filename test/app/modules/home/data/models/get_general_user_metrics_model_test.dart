import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:edumath/app/modules/home/data/models/general_user_metrics_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FireStoreMock {
  final instance = MockFirestoreInstance();

  add({String userID, int correctAnwers, int incorrectAnwers}) async {
    await instance.collection('users').add({
      'userid': userID,
      'username': "Bruno Alves",
    }).then((value) => value.collection('usermetrics').add({
          'correctanwers': correctAnwers,
          'incorrectanwers': incorrectAnwers,
        }));
  }

  Future<List<DocumentSnapshot>> getMetrics(String userId) async {
    List<DocumentSnapshot> metrics = [];
    final user = await instance
        .collection("users")
        .where('userid', isEqualTo: userId)
        .getDocuments();

    if (user.documents.isNotEmpty) {
      final result = await instance
          .collection('users')
          .document(user.documents[0].documentID)
          .collection('usermetrics')
          .getDocuments();

      return result.documents;
    }
    return metrics;

    //return result.documents[0];
  }
}

void main() {
  FireStoreMock fireStoreMock;
  setUp(() {
    fireStoreMock = FireStoreMock();
  });

  test('should be return a GeneralUserMetricsModel when call FromDocument',
      () async {
    await fireStoreMock.add(
        userID: "valid_id", correctAnwers: 10, incorrectAnwers: 2);
    final result = await fireStoreMock.getMetrics('valid_id');

    final generalUserMetrics =
        GeneralUserMetricsModel.fromDocument(result.first);

    expect(generalUserMetrics.correctAnwers, 10);
    expect(generalUserMetrics.incorrectAnwers, 2);
  });

  test(
      'should be return a GeneralUserMetricsModel with properties with value 0 when call FromDocument',
      () async {
    await fireStoreMock.add(
        userID: 'valid_id', correctAnwers: 0, incorrectAnwers: 0);
    final result = await fireStoreMock.getMetrics('valid_id');

    final generalUserMetrics =
        GeneralUserMetricsModel.fromDocument(result.first);

    expect(generalUserMetrics.correctAnwers, 0);
    expect(generalUserMetrics.incorrectAnwers, 0);
  });
}
