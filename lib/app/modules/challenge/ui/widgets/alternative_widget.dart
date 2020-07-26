import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class AlternativeWidget extends StatelessWidget {
  const AlternativeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        color: frColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              "Questãoda",
              //overflow: TextOverflow.visible,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
