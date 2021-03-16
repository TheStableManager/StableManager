import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

final dateFormat = new DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'de_DE');
final timeFormat = new DateFormat(DateFormat.HOUR24_MINUTE, 'de_DE');
final dateTimeFormat = DateFormat.yMd('de_DE').add_Hm();

class HorsesPage extends StatefulWidget {
  final BaseAuth auth;
  final User user;

  HorsesPage({this.user, this.auth});

  @override
  _HorsesPage createState() => new _HorsesPage();
}

class _HorsesPage extends State<HorsesPage> {
  @override
  void initState() {
    initializeDateFormatting();
    initAction();
    super.initState();
  }

  void initAction() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: []),
    );
  }
}
