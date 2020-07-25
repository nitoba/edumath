import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'tile_widget.dart';

class FunctionalitiesWidget extends StatelessWidget {
  const FunctionalitiesWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                onTap: () {},
                icon: Icon(Feather.layout, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
