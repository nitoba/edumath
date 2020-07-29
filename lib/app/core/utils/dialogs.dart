import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../constants.dart';

showOneDialog(BuildContext context, {String section, Function onPressed}) {
  showDialog(
    context: context,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: insaturationPurple,
      title: Text(
        section,
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Tem certeza que deseja sair ?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        FlatButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Feather.x_circle,
            color: Colors.white,
          ),
          label: Text(
            "Cancelar",
            style: TextStyle(color: Colors.white),
          ),
        ),
        FlatButton.icon(
          onPressed: onPressed,
          icon: Icon(
            Feather.log_out,
            color: Colors.white,
          ),
          label: Text(
            "Sair",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
  );
}
