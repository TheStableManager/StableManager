import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final User user;

  HomePage({this.user, this.auth, this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Text('Home'),
            ),
          ]),
        ),
      ),
    );
  }
}
