import 'package:stablemanager/services/auth.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  MyAppBar({Key key, this.title, this.auth, this.logoutCallback})
      : super(key: key);

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: "Abmelden",
          onPressed: () {
            auth.logoutAction().then((value) => logoutCallback());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
