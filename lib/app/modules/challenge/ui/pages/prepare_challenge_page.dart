import 'package:edumath/app/core/constants.dart';
import 'package:edumath/app/modules/challenge/ui/controllers/challenge_controller.dart';
import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrepareChallengePage extends StatelessWidget {
  final CategoriesEntity categorie;
  final String userId;

  const PrepareChallengePage({Key key, this.categorie, this.userId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Modular.get<ChallengeController>().goToChallenge(categorie, userId);
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 50),
        child: Container(
          decoration: BoxDecoration(
              color: frColor, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/pi.svg"),
                SizedBox(height: 20),
                Text(
                  categorie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Preparando seu\ndesafio",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
