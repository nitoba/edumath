import 'package:edumath/app/core/constants.dart';
import 'package:edumath/app/modules/challenge/ui/controllers/challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BoardQuestion extends StatelessWidget {
  final ChallengeController challengeController;
  const BoardQuestion({
    Key key,
    this.challengeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * 0.32,
      decoration: BoxDecoration(
        color: frColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Observer(builder: (_) {
        return Text(
          challengeController
              .questions[challengeController.currentQuestion].title,
          //overflow: TextOverflow.visible,
          style: TextStyle(color: Colors.white, fontSize: 14),
        );
      }),
    );
  }
}
