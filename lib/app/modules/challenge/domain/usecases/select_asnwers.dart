import 'package:flutter_modular/flutter_modular.dart';

part 'select_asnwers.g.dart';

abstract class ISelectAsnwers {
  call();
}

@Injectable(singleton: false)
class SelectAsnwers implements ISelectAsnwers {
  @override
  call() {}
}
