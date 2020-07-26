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
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: frColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              height: 40,
              width: 150,
              alignment: Alignment.center,
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
        ),
      ],
    );
  }
}
