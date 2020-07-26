import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:edumath/app/modules/home/data/models/general_user_metrics_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FireStoreMock {
  final instance = MockFirestoreInstance();

  add({String userID, Map<String, dynamic> userMetrics}) async {
    await instance.collection('users').add({
      'userid': userID,
      'username': "Bruno Alves",
      'userMetrics': userMetrics,
    });
  }

  Future<Map<String, dynamic>> getMetrics(String userId) async {
    Map<String, dynamic> metrics;
    final result = await instance
        .collection("users")
        .where('userid', isEqualTo: userId)
        .getDocuments();

    if (result.documents.isNotEmpty) {
      var correctsum = 0;
      var incorrectsum = 0;

      (result.documents.first.data['userMetrics']['correctanwers'] as Map)
          .forEach((key, value) {
        correctsum = correctsum + value;
      });

      (result.documents.first.data['userMetrics']['incorrectanwers'] as Map)
          .forEach((key, value) {
        incorrectsum = incorrectsum + value;
      });

      metrics = {
        'correctanwers': correctsum,
        'incorrectanwers': incorrectsum,
      };

      return metrics;
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

  test('should be return a GeneralUserMetricsModel when call fromJson',
      () async {
    await fireStoreMock.add(userID: "valid_id", userMetrics: {
      "correctanwers": {"ab": 1, "cd": 5, "ed": 4},
      "incorrectanwers": {"ab": 2, "cd": 2, "ed": 4},
    });
    final result = await fireStoreMock.getMetrics('valid_id');

    final generalUserMetrics = GeneralUserMetricsModel.fromJson(result);

    expect(generalUserMetrics.correctAnwers, 10);
    expect(generalUserMetrics.incorrectAnwers, 8);
  });

  test(
      'should be return a GeneralUserMetricsModel with properties with value 0 when call fromJson',
      () async {
    await fireStoreMock.add(
      userID: 'valid_id',
      userMetrics: {
        "correctanwers": {"ab": 0, "cd": 0, "ed": 0},
        "incorrectanwers": {"ab": 0, "cd": 0, "ed": 0}
      },
    );

    final result = await fireStoreMock.getMetrics('valid_id');

    final generalUserMetrics = GeneralUserMetricsModel.fromJson(result);

    expect(generalUserMetrics.correctAnwers, 0);
    expect(generalUserMetrics.incorrectAnwers, 0);
  });
}
