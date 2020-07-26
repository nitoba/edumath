import 'package:edumath/app/core/constants.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final Icon icon;
  const TileWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      //minWidth: MediaQuery.of(context).size.width * 0.20,

      height: MediaQuery.of(context).size.height * 0.20,
      color: frColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 22),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
