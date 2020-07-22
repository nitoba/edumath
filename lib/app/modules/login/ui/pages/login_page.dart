import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login Page"}) : super(key: key);

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
      appBar: AppBar(
        title:
            Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Font - Poppins", style: TextStyle(fontSize: 25)),
            RaisedButton(
                child: Text(
                  "Logar",
                  //style: TextStyle(),
                ),
                onPressed: controller.login),
          ],
        ),
      ),
    );
  }
}
