import 'dart:ui';

import 'package:stablemanager/pages/settings/privacy.dart';
import 'package:stablemanager/pages/settings/user.dart';
import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final User user;

  SettingsPage({this.user, this.auth, this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: ListTileTheme(
            iconColor: IconTheme.of(context).color,
            child: Column(
              children: [
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    color: Theme.of(context).primaryColorLight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          title: Text(
                            this.user.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            this.user.email,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  leading: Icon(Icons.notifications),
                  title: Text('Benachrichtigungen'),
                  onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Nicht implementiert'),
                  )),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  leading: Icon(Icons.settings),
                  title: Text('Allgemein'),
                  onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Nicht implementiert'),
                  )),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  leading: Icon(Icons.person),
                  title: Text('Persönliche Daten'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: Text('Persönliche Daten')),
                          body: SettingsUserPage(
                              user: this.user,
                              auth: this.auth,
                              logoutCallback: this.logoutCallback),
                        );
                      },
                    ));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  leading: Icon(Icons.lock),
                  title: Text('Datenschutz'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: Text('Datenschutzerklärung')),
                          body: PrivacyPage(
                            auth: this.auth,
                            logoutCallback: this.logoutCallback,
                          ),
                        );
                      },
                    ));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  leading: Icon(Icons.help),
                  title: Text('Support'),
                  onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Nicht implementiert'),
                  )),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  title: Text('App Version: '),
                  trailing: FutureBuilder(
                    future: getVersionNumber(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? snapshot.data : '',
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  title: Text('Buildnummer: '),
                  trailing: FutureBuilder(
                    future: getBuildnNumber(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? snapshot.data : '',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getBuildnNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
