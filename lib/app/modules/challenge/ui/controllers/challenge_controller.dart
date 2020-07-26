import 'package:flutter_modular/flutter_modular.dart';
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

  goToChallenge() {
    Future.delayed(Duration(seconds: 2),
        () => Modular.link.pushReplacementNamed('/challengePage'));
  }
}
