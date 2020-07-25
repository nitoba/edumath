import 'package:mobx/mobx.dart';

part 'challenge_controller.g.dart';

class ChallengeController = _ChallengeControllerBase with _$ChallengeController;

abstract class _ChallengeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
