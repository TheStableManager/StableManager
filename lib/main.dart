import 'package:stablemanager/pages/home/home.dart';
import 'package:stablemanager/pages/login.dart';
import 'package:stablemanager/pages/settings/settings.dart';
import 'package:stablemanager/pages/stable/stable.dart';
import 'package:stablemanager/services/auth.dart';
import 'package:stablemanager/models/user.dart';
import 'package:stablemanager/theme/theme.dart';
import 'package:stablemanager/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthStatus { NOT_DETERMINED, NOT_LOGGED_IN, LOGGED_IN }

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StableManager",
      theme: AppTheme.light(),
      home: RootPage(appTitle: "StableManager"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('de', 'DE')],
    );
  }
}

class RootPage extends StatefulWidget {
  RootPage({this.appTitle, this.page});

  final String appTitle;
  final StatelessWidget page;

  @override
  _RootPageState createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  BaseAuth auth;
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  User user;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions;
  static List<String> _widgetTitles;
  String _title;

  @override
  void initState() {
    setState(() {
      authStatus = AuthStatus.NOT_DETERMINED;
      _title = widget.appTitle;
    });
    initAction();
    super.initState();
  }

  void initAction() async {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
    });
  }

  Future<void> loginAction() async {}

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
    });
  }

  void updateUserCallback() {
    setState(() {
      user = auth.getUser();
      _widgetOptions = <Widget>[
        HomePage(
            user: this.user, auth: this.auth, logoutCallback: logoutCallback),
        StablePage(
            user: this.user, auth: this.auth, logoutCallback: logoutCallback),
        SettingsPage(
            user: this.user, auth: this.auth, logoutCallback: logoutCallback),
      ];
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle),
        ),
        body: Container(
            alignment: Alignment.center, child: CircularProgressIndicator()));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = _widgetTitles.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage(
            appTitle: _title, auth: this.auth, loginAction: loginAction);
        break;
      case AuthStatus.LOGGED_IN:
        return MaterialApp(
          title: widget.appTitle,
          theme: AppTheme.light(),
          home: new Scaffold(
            appBar: MyAppBar(
                title: _title, auth: this.auth, logoutCallback: logoutCallback),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Startseite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Mein Studium',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Einstellungen',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[Locale('de', 'DE')],
        );
        break;
      default:
        return buildWaitingScreen();
    }
  }
}
