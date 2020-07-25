import 'package:edumath/app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

AppBar headerWidget({@required Function goBack, @required Function logout}) {
  return AppBar(
    backgroundColor: frColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: InkWell(
      child: Container(child: Icon(Feather.arrow_left, color: Colors.white)),
      onTap: goBack,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 24),
        child: InkWell(
          child: Icon(Feather.log_out, color: Colors.white),
          onTap: logout,
        ),
      )
    ],
  );
}
