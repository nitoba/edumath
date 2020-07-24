import 'package:edumath/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GeneralUserMetricsWidget extends StatelessWidget {
  final HomeController homeController;

  const GeneralUserMetricsWidget({
    Key key,
    this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (homeController.generalUserMetricsEntity != null) {
        return Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Feather.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "${homeController.generalUserMetricsEntity.correctAnwers}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "acertos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 2,
                  height: 50,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Feather.x, color: Colors.white, size: 28),
                        SizedBox(width: 8),
                        Text(
                          "${homeController.generalUserMetricsEntity.incorrectAnwers}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "erros",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        );
      }
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ));
    });
  }
}
