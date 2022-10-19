import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      height: 240,
      width: 240,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark
              ]),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 4,
                color: Colors.black)
          ],
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(80))),
      child: const Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    );
  }
}
