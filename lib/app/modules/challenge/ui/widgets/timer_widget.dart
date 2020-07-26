import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "03 questões",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: insaturationPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Tempo: 08:35",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
