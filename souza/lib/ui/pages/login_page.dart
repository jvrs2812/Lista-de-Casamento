import 'package:flutter/material.dart';

import '../components/components.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            Headline1(text: 'Login'),
            Padding(
                padding: const EdgeInsets.all(32),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email', icon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 32),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              icon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColorLight,
                              )),
                          obscureText: true,
                        ),
                      ),
                      RaisedButton(
                        onPressed: null,
                        child: Text('Entrar'.toUpperCase()),
                      ),
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          label: const Text('Criar Conta'))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
