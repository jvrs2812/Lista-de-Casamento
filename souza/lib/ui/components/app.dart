import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souza/ui/pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    const primaryColor = Color.fromRGBO(136, 14, 79, 1);

    const primaryColorDark = Color.fromRGBO(96, 0, 39, 1);

    const primaryColorLigth = Color.fromRGBO(188, 71, 123, 1);

    return MaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLigth,
          accentColor: primaryColor,
          backgroundColor: Colors.white,
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColorDark)),
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColorLigth)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              alignLabelWithHint: true),
          buttonTheme: const ButtonThemeData(
              colorScheme: ColorScheme.light(primary: primaryColor),
              buttonColor: primaryColor,
              splashColor: primaryColorLigth,
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20))),
      home: LoginPage(),
    );
  }
}
