import 'package:edumath/app/modules/challenge/domain/entities/score_entity.dart';
import 'package:edumath/app/modules/challenge/domain/repositories/ichallenge_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'save_user_score.g.dart';

abstract class ISaveUserScore {
  Future call(ScoreEntity scoreEntity);
}

@Injectable(singleton: false)
class SaveUserScore implements ISaveUserScore {
  final IChallengeRepository challengeRepository;

  SaveUserScore(this.challengeRepository);
  @override
  Future call(ScoreEntity scoreEntity) async {
    await challengeRepository.saveUserScore(scoreEntity);
  }
}
