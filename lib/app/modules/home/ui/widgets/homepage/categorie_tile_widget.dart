import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants.dart';

class CategorieTileWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final String iconSvg;
  const CategorieTileWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    this.iconSvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      //minWidth: MediaQuery.of(context).size.width * 0.40,
      //height: MediaQuery.of(context).size.height * 0.20,
      color: frColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/pi.svg"),
          SizedBox(height: 22),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
