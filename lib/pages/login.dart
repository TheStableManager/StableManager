import 'package:stablemanager/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({this.appTitle, this.auth, this.loginAction});

  final String appTitle;
  final BaseAuth auth;
  final AsyncCallback loginAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () async {
                  await loginAction();
                },
                child: Text("Anmelden"))));
  }
}
