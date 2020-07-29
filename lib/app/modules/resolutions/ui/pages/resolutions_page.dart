import 'package:edumath/app/core/constants.dart';
import 'package:edumath/app/modules/challenge/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/resolutions_controller.dart';

class ResolutionsPage extends StatefulWidget {
  final ObservableList<QuestionEntity> questions;
  const ResolutionsPage({
    Key key,
    this.questions,
  }) : super(key: key);

  @override
  _ResolutionsPageState createState() => _ResolutionsPageState();
}

class _ResolutionsPageState
    extends ModularState<ResolutionsPage, ResolutionsController> {
  //use 'controller' variable to access controller
  YoutubePlayerController _controller;
  @override
  void initState() {
    controller.getVideosIds(widget.questions);
    _controller = YoutubePlayerController(
      initialVideoId: controller.videoQuestions[0].videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: frColor,
        progressColors: ProgressBarColors(
          playedColor: frColor,
          handleColor: insaturationPurple,
        ),
      ),
      builder: (BuildContext context, Widget player) => Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
                decoration: BoxDecoration(
                  color: insaturationPurple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Resolução\nQuestão 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(Feather.video, color: Colors.white, size: 80)
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: insaturationPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: player,
                ),
              ),
              Spacer(),
              Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  color: frColor,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Próximo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Feather.arrow_right_circle,
                          color: Colors.white, size: 30),
                    ],
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
