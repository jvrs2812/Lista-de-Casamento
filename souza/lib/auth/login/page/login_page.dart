import 'package:flutter/material.dart';
import 'package:souza/constants/constants.dart';

class LoginPpage extends StatefulWidget {
  const LoginPpage({Key? key}) : super(key: key);

  @override
  State<LoginPpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.primaryColor,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: size.height * 0.15),
                child: Image.asset('assets/images/logo.png')),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.only(top: 30),
              child: TextFormField(
                cursorHeight: 20,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        fontFamily: Constants.fontPrimary)),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.only(top: 15),
              child: TextFormField(
                cursorHeight: 20,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        fontFamily: Constants.fontPrimary)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            InkWell(
              onTap: () {},
              child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Constants.secondColor,
                  ),
                  child: Center(
                    child: Text('Entrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Constants.fontPrimary,
                            fontSize: 25)),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Text(
              'ou',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: Constants.fontPrimary,
                  fontSize: 15),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            InkWell(
              onTap: () {},
              child: Text(
                'Registre-se',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Constants.fontPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.20),
              alignment: Alignment.bottomCenter,
              child: Text('Powered by SouzaInnovation',
                  style: TextStyle(
                      fontFamily: Constants.fontPrimary,
                      color: Colors.white60)),
            ),
          ],
        ),
      ),
    );
  }
}
