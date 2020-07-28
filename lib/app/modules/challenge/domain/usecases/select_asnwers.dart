import 'package:flutter_modular/flutter_modular.dart';

part 'select_asnwers.g.dart';

abstract class ISelectAsnwers {
  bool call(Map<String, dynamic> isRigth);
}

@Injectable(singleton: false)
class SelectAsnwers implements ISelectAsnwers {
  @override
  bool call(Map<String, dynamic> isRigth) {
    if (isRigth['isRight']) {
      return true;
    } else {
      return false;
    }
  }
}
