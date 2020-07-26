import 'package:edumath/app/modules/profile/domain/entities/user_metric_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants.dart';

class MetricsTile extends StatelessWidget {
  final UserMetricEntity userMetricEntity;
  const MetricsTile({Key key, @required this.userMetricEntity})
      : super(key: key);

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
                  userMetricEntity.categorieName,
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
                    userMetricEntity.correctanwers >= 10
                        ? userMetricEntity.correctanwers.toString()
                        : "0${userMetricEntity.correctanwers}",
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
                    userMetricEntity.incorrectanwers >= 10
                        ? userMetricEntity.incorrectanwers.toString()
                        : "0${userMetricEntity.incorrectanwers}",
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
