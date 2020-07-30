import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:edumath/app/modules/resolutions/domain/entities/video_entity.dart';
import 'package:edumath/app/modules/resolutions/domain/usecases/url_to_videoid.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'resolutions_controller.g.dart';

@Injectable()
class ResolutionsController = _ResolutionsControllerBase
    with _$ResolutionsController;

abstract class _ResolutionsControllerBase with Store {
  YoutubePlayerController youtubeController;

  final IUrlToVideoId urlToVideoId;

  @observable
  int _indexVideo = 0;
  @observable
  String labelButtom = "Próximo";

  List<VideoEntity> _videoQuestions;

  _ResolutionsControllerBase(this.urlToVideoId);

  @action
  getVideosIds(ObservableList<QuestionEntity> questions) {
    List<String> linkVideos =
        questions.map((question) => question.linkvideo).toList();

    this._videoQuestions = urlToVideoId(linkVideos);
  }

  @action
  void nextVideo() {
    if (_indexVideo == (_videoQuestions.length - 1)) Modular.to.pop();

    _indexVideo++;
    youtubeController.load(_videoQuestions[_indexVideo].videoId);

    if (_indexVideo == (_videoQuestions.length - 1)) labelButtom = "Sair";
  }

  get getInitialVideo => _videoQuestions[_indexVideo].videoId;
  @computed
  get currectQuestionVideo => _indexVideo + 1;
}
