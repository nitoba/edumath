import 'package:edumath/app/modules/challenge/ui/controllers/challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/constants.dart';

class TimerWidget extends StatelessWidget {
  final ChallengeController controller;
  const TimerWidget({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(builder: (_) {
          return Text(
            "0${controller.questions.length} questões",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          );
        }),
        Stack(
          children: [
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.35),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Observer(builder: (_) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 40,
                width: controller.progressTimer,
                decoration: BoxDecoration(
                  color: controller.progressTimer > 75.0
                      ? frColor
                      : controller.progressTimer < 25.0
                          ? Colors.red
                          : Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
            Observer(builder: (_) {
              return Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                child: Text(
                  "Tempo: ${controller.timer}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
