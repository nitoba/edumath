import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants.dart';
import '../../../login/domain/entities/user_entity.dart';
import '../controllers/home_controller.dart';
import '../widgets/homepage/categorie_tile_widget.dart';
import '../widgets/homepage/general_user_metrics_widget.dart';
import '../widgets/homepage/header_widget.dart';

class HomePage extends StatefulWidget {
  final UserEntity user;
  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(
                user: widget.user,
                onTap: () {},
              ),
              SizedBox(height: 55),
              GeneralUserMetricsWidget(),
              SizedBox(height: 70),
              Text(
                "Seleção de categorias",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (contenxt, index) {
                    return CategorieTileWidget(
                      title: "Trigonometria",
                      onTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
