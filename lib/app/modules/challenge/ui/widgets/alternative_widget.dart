import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/constants.dart';

class AlternativeWidget extends StatelessWidget {
  final bool isCorrect;
  const AlternativeWidget({
    Key key,
    this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isCorrect == null
              ? frColor
              : isCorrect ? correctColor : incorrectColor,
        ),
        duration: Duration(milliseconds: 200),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questãoda",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              if (isCorrect != null)
                Icon(
                  isCorrect ? Feather.check_square : Feather.x_circle,
                  color: Colors.white,
                ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
