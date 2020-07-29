import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/resolutions/domain/entities/video_entity.dart';
import 'package:edumath/app/modules/resolutions/domain/usecases/url_to_videoid.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'resolutions_controller.g.dart';

@Injectable()
class ResolutionsController = _ResolutionsControllerBase
    with _$ResolutionsController;

abstract class _ResolutionsControllerBase with Store {
  final IUrlToVideoId urlToVideoId;
  @observable
  List<VideoEntity> videoQuestions;

  _ResolutionsControllerBase(this.urlToVideoId);

  @action
  getVideosIds(ObservableList<QuestionEntity> questions) {
    List<String> linkVideos =
        questions.map((question) => question.linkvideo).toList();

    this.videoQuestions = urlToVideoId(linkVideos);
  }
}
