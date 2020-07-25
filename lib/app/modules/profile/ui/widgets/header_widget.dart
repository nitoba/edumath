import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/constants.dart';
import '../../../login/domain/entities/user_entity.dart';

class SliverHeaderWidget extends StatelessWidget {
  const SliverHeaderWidget(
      {Key key,
      @required this.tabController,
      @required this.user,
      @required this.goBack,
      @required this.logout})
      : super(key: key);

  final Function goBack;
  final Function logout;
  final UserEntity user;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      backgroundColor: frColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: IconButton(
        icon: Icon(Feather.arrow_left, color: Colors.white),
        onPressed: goBack,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: IconButton(
            icon: Icon(Feather.log_out, color: Colors.white),
            onPressed: logout,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.only(top: 70),
          width: double.infinity,
          decoration: BoxDecoration(
            color: frColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 25),
              Hero(
                tag: user.userId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.userPhoto,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.userName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                "usuário",
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              //Spacer(),
            ],
          ),
        ),
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        controller: tabController,
        tabs: [
          Tab(
            text: "Métricas",
          ),
          Tab(
            text: "Funcionalidades",
          ),
        ],
      ),
    );
  }
}
