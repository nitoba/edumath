import 'package:flutter/material.dart';

import '../../../../login/domain/entities/user_entity.dart';

class HeaderWidget extends StatelessWidget {
  final UserEntity user;
  final Function onTap;

  const HeaderWidget({
    Key key,
    @required this.user,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Olá, ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  user.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              "Bem vindo de volta!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          child: Hero(
            tag: user.userId,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(user.userPhoto),
                ),
              ),
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
