import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'tile_widget.dart';

class FunctionalitiesWidget extends StatelessWidget {
  const FunctionalitiesWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 16.0),
      child: Column(
        children: [
          Wrap(
            spacing: 30,
            children: [
              TileWidget(
                title: "Baixar lista de questões",
                onTap: () {},
                icon: Icon(Feather.download, color: Colors.white),
              ),
              TileWidget(
                title: "Como funciona ?",
                onTap: () => Modular.link.pushNamed('/howtowork'),
                icon: Icon(Feather.layout, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
