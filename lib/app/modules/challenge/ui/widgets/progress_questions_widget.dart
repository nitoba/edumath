import 'package:edumath/app/modules/challenge/ui/controllers/challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProgressQuestions extends StatelessWidget {
  final ChallengeController controller;

  const ProgressQuestions({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(builder: (_) {
            return Text(
              "Questão 0${controller.currentQuestion + 1} de 0${controller.questions.length}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            );
          }),
          SizedBox(height: 15),
          Stack(
            children: [
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Observer(builder: (_) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 15,
                  width: ((MediaQuery.of(context).size.width - 32.0) /
                          controller.questions.length) *
                      (controller.currentQuestion + 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
