import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IGetGeneralMetricsFirestore {
  Future<List<DocumentSnapshot>> getGeneralMetricsOfUser(String userId);
}

class GetGereneralMetricsFirestore implements IGetGeneralMetricsFirestore {
  final Firestore instance = Firestore.instance;
  @override
  Future<List<DocumentSnapshot>> getGeneralMetricsOfUser(String userId) async {
    List<DocumentSnapshot> metrics = [];
    final user = await instance
        .collection("users")
        .where('userid', isEqualTo: userId)
        .getDocuments();

    if (user.documents.isNotEmpty) {
      return metrics = user.documents;
    }
    return metrics;
  }
}
