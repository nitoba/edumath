import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';
part 'get_user_metrics_firestore.g.dart';

abstract class IGetUserMetricsFirestore {
  Future<Map> getUserMetrics(String userId);
}

@Injectable()
class GetUserMetricsFirestore implements IGetUserMetricsFirestore {
  final Firestore instance;

  GetUserMetricsFirestore(this.instance);

  @override
  Future<Map> getUserMetrics(String userId) async {
    var userDatas = await instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .getDocuments();

    return userDatas.documents.first.data['userMetrics'];
  }
}
