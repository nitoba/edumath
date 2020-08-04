import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/constants.dart';

class BtnNextQuestion extends StatelessWidget {
  final Function nextQuestion;
  const BtnNextQuestion({
    Key key,
    @required this.nextQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 150,
        child: MaterialButton(
          height: 60,
          color: insaturationPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Próxima",
                //overflow: TextOverflow.visible,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Feather.arrow_right_circle, color: Colors.white)
            ],
          ),
          onPressed: nextQuestion,
        ),
      ),
    );
  }
}
