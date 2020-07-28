import 'package:edumath/app/modules/challenge/ui/widgets/alternative_widget.dart';
import 'package:edumath/app/modules/challenge/ui/widgets/board_question_widget.dart';
import 'package:edumath/app/modules/challenge/ui/widgets/next_question_widget.dart';
import 'package:edumath/app/modules/challenge/ui/widgets/progress_questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/constants.dart';
import '../controllers/challenge_controller.dart';
import '../widgets/timer_widget.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  const ChallengePage({Key key, this.title = "Challenge"}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState
    extends ModularState<ChallengePage, ChallengeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.countTimer(timeToMinutes: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(goBack: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TimerWidget(controller: controller),
              SizedBox(height: 22),
              ProgressQuestions(controller: controller),
              SizedBox(height: 22),
              BoardQuestion(challengeController: controller),
              SizedBox(height: 30),
              Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => AlternativeWidget(
                    challengeController: controller,
                    index: index,
                  ),
                );
              }),
              SizedBox(height: 30),
              BtnNextQuestion(
                nextQuestion: () {
                  controller.nextQuestion();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar({Function goBack}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: IconButton(
        icon: Icon(Feather.arrow_left, color: Colors.white),
        onPressed: goBack,
      ),
    );
  }
}
