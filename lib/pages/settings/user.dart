import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsUserPage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final User user;

  SettingsUserPage({this.user, this.auth, this.logoutCallback});

  @override
  _SettingsUserPage createState() => new _SettingsUserPage();
}

class _SettingsUserPage extends State<SettingsUserPage> {
  final _formKey = GlobalKey<FormState>();
  static String _mail = '';
  static String _name = '';
  static String _address = '';
  static String _plz = '';
  static String _city = '';
  static String _phoneNumber = '';

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    setState(() {
      _mail = widget.user.email ?? '';
      _name = widget.user.name ?? '';
      _address = widget.user.address ?? '';
      _plz = widget.user.plz ?? '';
      _city = widget.user.city ?? '';
      _phoneNumber = widget.user.phoneNumber ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [Text('ToDo')]),
    );
  }
}
