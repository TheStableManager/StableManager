import 'package:stablemanager/pages/stable/horses.dart';
import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:flutter/material.dart';

class StablePage extends StatelessWidget {
  static const String routeName = '/stable';
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final User user;
  static Map<String, Widget> _widgetOptions;

  final Map<String, IconData> icons = {
    'menu_book': Icons.menu_book
  };
  final List<Map<String, String>> entries = [
    {
      'name': 'Infektion melden',
      'page': 'HorsesPage',
      'icon': 'menu_book'
    },
  ];

  StablePage({this.user, this.auth, this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    _widgetOptions = {
      'HorsesPage': HorsesPage(user: user, auth: auth)
    };
    return Scaffold(
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          itemCount: entries.length,
          itemBuilder: (context, int index) {
            return _buildCard(context, entries[index]);
          },
        ),
      ),
    );
  }

  _buildCard(BuildContext context, Map<String, String> entry) => Column(
        children: [
          SizedBox(height: 25),
          SizedBox(
            height: 75,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileTheme(
                    iconColor: IconTheme.of(context).color,
                    child: ListTile(
                      title: Text(entry['name'],
                          style: Theme.of(context).textTheme.subtitle1),
                      leading: Icon(icons[entry['icon']]),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(title: Text(entry['name'])),
                              body: _widgetOptions.entries
                                  .singleWhere((e) => (e.key == entry['page']))
                                  .value,
                            );
                          },
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
