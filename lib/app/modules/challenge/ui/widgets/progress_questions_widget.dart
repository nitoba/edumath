import 'package:flutter/material.dart';

class ProgressQuestions extends StatelessWidget {
  final int currentQuestion;
  final double progressQuestion;
  const ProgressQuestions({
    Key key,
    this.currentQuestion = 1,
    this.progressQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Questão 0$currentQuestion de 03",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
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
              AnimatedContainer(
                duration: Duration(milliseconds: 350),
                height: 15,
                width: ((MediaQuery.of(context).size.width - 32.0) / 3.0) *
                    currentQuestion,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
