import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/challenge/challenge_module.dart';
import 'package:edumath/app/modules/login/login_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:edumath/app/app_widget.dart';

import 'modules/home/home_module.dart';
import 'modules/profile/profile_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<Firestore>((i) => Firestore.instance),
        Bind<FirebaseAuth>((i) => FirebaseAuth.instance)
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router("/home", module: HomeModule()),
        Router("/profile", module: ProfileModule()),
        Router("/challenge", module: ChallengeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
