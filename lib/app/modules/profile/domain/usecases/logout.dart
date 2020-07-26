import 'package:edumath/app/modules/login/data/datasource/google_login_firebase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

part 'logout.g.dart';

abstract class ILogout {
  Future<void> logout();
}

@Injectable(singleton: false)
class Logout extends LoginWithFirebase implements ILogout {
  @override
  Future<void> logout() {
    return super.logout();
  }
}
