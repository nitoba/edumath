import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/constants.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              height: MediaQuery.of(context).size.height * 0.60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: frColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/images/square-root.svg"),
                  SizedBox(height: 15),
                  Text(
                    "EduMath",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "testes suas habilidades\nem matemática",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: frColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesome.google,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Login com Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                controller.login();
              }),
          Spacer(),
          SvgPicture.asset("assets/images/pi.svg"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
