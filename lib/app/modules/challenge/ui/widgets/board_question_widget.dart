import 'package:edumath/app/core/constants.dart';
import 'package:flutter/material.dart';

class BoardQuestion extends StatelessWidget {
  const BoardQuestion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * 0.32,
      decoration: BoxDecoration(
        color: frColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Questãodasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdqwewdawdasdasdawdqweasdasdasdasasdasdasdasdasdasdasdasdasdasdasdqweqwdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdaqweqwdasdas",
        //overflow: TextOverflow.visible,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
