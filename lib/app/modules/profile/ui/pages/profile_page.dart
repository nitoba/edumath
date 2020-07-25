import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants.dart';
import '../../../login/domain/entities/user_entity.dart';
import '../controllers/profile_controller.dart';
import '../widgets/functionalities_widget.dart';
import '../widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  final UserEntity user;
  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController>
    with TickerProviderStateMixin {
  //use 'controller' variable to access controller
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: headerWidget(goBack: () => Modular.to.pop(), logout: () {}),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: frColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25),
                Hero(
                  tag: widget.user.userId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(widget.user.userPhoto, height: 100),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.user.userName,
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
                Spacer(),
                TabBar(
                  indicatorColor: bgColor,
                  controller: tabController,
                  //isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Métricas",
                    ),
                    Tab(
                      text: "Funcionalidades",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              controller: tabController,
              children: [
                Text(
                  "usuário",
                  style: TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                FunctionalitiesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
