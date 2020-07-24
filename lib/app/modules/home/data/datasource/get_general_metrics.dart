import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
part 'get_general_metrics.g.dart';

abstract class IGetGeneralMetricsFirestore {
  Future<List<DocumentSnapshot>> getGeneralMetricsOfUser(String userId);
}

@Injectable()
class GetGereneralMetricsFirestore implements IGetGeneralMetricsFirestore {
  final Firestore instance = Firestore.instance;
  @override
  Future<List<DocumentSnapshot>> getGeneralMetricsOfUser(String userId) async {
    List<DocumentSnapshot> metrics = [];
    final user = await instance
        .collection("users")
        .where('userId', isEqualTo: userId)
        .getDocuments();

    if (user.documents.isNotEmpty) {
      return metrics = user.documents;
    }
    return metrics;
  }
}
