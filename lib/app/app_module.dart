import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edumath/app/modules/challenge/challenge_module.dart';
import 'package:edumath/app/modules/login/login_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:edumath/app/app_widget.dart';

import 'modules/home/home_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/resolutions/resolutions_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<Firestore>((i) => Firestore.instance),
        Bind<FirebaseAuth>((i) => FirebaseAuth.instance)
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/profile", module: ProfileModule()),
        ModularRouter("/challenge", module: ChallengeModule()),
        ModularRouter("/resolutions", module: ResolutionsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
