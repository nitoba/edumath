import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants.dart';

class MetricsTile extends StatelessWidget {
  final String categorieName;
  final int correctanwers;
  final int incorrectanwers;
  const MetricsTile({
    Key key,
    @required this.categorieName,
    @required this.correctanwers,
    @required this.incorrectanwers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: frColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categorieName,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SvgPicture.asset("assets/images/pi.svg"),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Respostas corretas",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: insaturationPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    correctanwers >= 10
                        ? correctanwers.toString()
                        : "0$correctanwers",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Respostas erradas:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: insaturationPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    incorrectanwers >= 10
                        ? incorrectanwers.toString()
                        : "0$incorrectanwers",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
