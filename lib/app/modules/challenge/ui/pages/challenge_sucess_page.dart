import 'package:edumath/app/core/constants.dart';
import 'package:edumath/app/modules/challenge/ui/controllers/challenge_controller.dart';
import 'package:edumath/app/modules/home/domain/entities/categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lottie/lottie.dart';

class SucessPage extends StatelessWidget {
  final CategoriesEntity categorie;

  const SucessPage({Key key, this.categorie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Modular.get<ChallengeController>().goToChallenge(categorie.id);
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
                Icon(Feather.award, color: Colors.white, size: 60),
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
                  "Parabéns",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Você cumpriu o desafio, não se preocupe se não acertou todas de primeira. O importante é sempre tentar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Lottie.asset("assets/animation/sucess.json",
                      height: 150, width: 150),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
