import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../login/domain/entities/user_entity.dart';
import '../controllers/home_controller.dart';

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
      appBar: AppBar(
        title: Text(widget.user.userName),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
