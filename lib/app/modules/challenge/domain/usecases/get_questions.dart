import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/challenge/domain/repositories/ichallenge_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

part 'get_questions.g.dart';

abstract class IGetQuestions {
  Future<List<QuestionEntity>> call(String categorieId);
}

@Injectable()
class GetQuestions implements IGetQuestions {
  final IChallengeRepository challengeRepository;
  GetQuestions(this.challengeRepository);
  @override
  Future<List<QuestionEntity>> call(String categorieId) async {
    return await challengeRepository.getQuestions(categorieId);
  }
}
