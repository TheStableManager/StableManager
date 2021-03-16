import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stablemanager/services/auth.dart';

class PrivacyPage extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  PrivacyPage({this.auth, this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Datenschutzerklärung StableManager\n',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          Text('Präambel\n', style: Theme.of(context).textTheme.headline6),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(text: '''
Mit der folgenden Datenschutzerklärung möchten wir Sie darüber aufklären, welche Arten Ihrer personenbezogenen Daten und Gesundheitsdaten wir zu welchen Zwecken und in welchem Umfang verarbeiten. Die Datenschutzerklärung gilt für alle von uns durchgeführten Verarbeitungen personenbezogener Daten und Gesundheitsdaten, sowohl im Rahmen der Erbringung unserer Leistungen als auch insbesondere auf unserer Webseite, in mobilen Applikationen sowie innerhalb externer Onlinepräsenzen (nachfolgend zusammenfassend bezeichnet als "Onlineangebot“).

Wir verarbeiten personenbezogene Daten und Gesundheitsdaten unter Beachtung der einschlägigen Datenschutzvorschriften, insbesondere der DSGVO und des BDSG. Eine Datenverarbeitung durch uns findet nur auf der Grundlage einer gesetzlichen Erlaubnis statt. Bei der Nutzung unseres Onlineangebots verarbeiten wir personenbezogene Daten nur mit Ihrer Einwilligung (Art. 6 Abs. 1 Buchst. a) DSGVO), sowie im Falle von Gesundheitsdaten (Art. 9 Abs. 2 Buchst. a) DSGVO). Des Weiteren wenn die Verarbeitung zur Wahrung unserer berechtigten Interessen oder den berechtigten Interessen eines Dritten erforderlich ist, sofern nicht Ihre Interessen oder Grundrechte und Grundfreiheiten, die den Schutz personenbezogener Daten erfordern, überwiegen (Art. 6 Abs. 1 Buchst. f) DSGVO).

Herausgeber der StableManager-App und Web-Applikation:

    Maximilian Stadtmüller
    Rothengrund 24
    63776 Mömbris

Unser Datenschutzbeauftragte ist unter folgenden Kontaktdaten zu erreichen:

    Maximilian Stadtmüller
    info@thestablemanager.com
'''),
              ],
            ),
          ),
          Text('\nAllgemeine Angaben zur Datenverarbeitung\n',
              style: Theme.of(context).textTheme.headline6),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                    text: 'Verarbeitung folgender Daten:\n',
                    style: Theme.of(context).textTheme.subtitle1),
                TextSpan(
                    text: '\nTechnische Daten\n',
                    style: Theme.of(context).textTheme.subtitle2),
                TextSpan(text: '''
  - angeforderte Ressource
  - IP-Adresse
  - Request-Methode
  - HTTP-Statuscode
  - Datum und Uhrzeit des Requests
'''),
                TextSpan(
                    text: '\nPersönliche Daten\n',
                    style: Theme.of(context).textTheme.subtitle2),
                TextSpan(text: '''
  - Name
  - Vorname
  - E-Mail-Adresse
  - Passwort
  - Adresse (Straße, Hausnummer, Postleitzahl und Ort)
  - Telefonnummer
'''),
              ],
            ),
          ),
          Text('\nCookies\n', style: Theme.of(context).textTheme.headline6),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                    text:
                        'Wir verwenden auf unserer Website Cookies. Bei Cookies handelt es sich um kleine Textdateien, die durch Ihren Browser gespeichert werden, wenn Sie eine Website besuchen. Hierdurch wird der verwendete Browser gekennzeichnet und kann durch unseren Webserver wiedererkannt werden. Dabei verwenden wir insbesondere dauerhafte Cookies („Persistent Cookies“) für die Analyse unserer Website. Diese Cookies werden automatisiert nach einer vorgegebenen Dauer gelöscht, die sich je nach Cookie unterscheiden kann. Sofern es durch die Verwendung von Cookies zu einer Verarbeitung personenbezogener Daten kommt, beruht diese auf der Rechtsgrundlage des Art. 6 Abs. 1 Buchst. f) DSGVO. Diese Verarbeitung dient unserem berechtigten Interesse, unsere Website nutzerfreundlicher, effektiver sowie sicherer zu machen. Sie können die Cookies in den Sicherheitseinstellungen Ihres Browsers jederzeit löschen. Sie können der Verwendung von Cookies durch Ihre Browsereinstellungen grundsätzlich widersprechen.'),
              ],
            ),
          ),
          Text('\nIhre Rechte\n', style: Theme.of(context).textTheme.headline6),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(text: '''
Sie können als betroffene Person Ihre Rechte geltend machen. Dabei haben Sie insbesondere die folgenden Rechte:

  - Sie haben das Recht, nach Maßgabe des Art. 16 DSGVO von uns die Berichtigung Ihrer Daten zu verlangen.
  - Sie haben das Recht, nach Maßgabe des Art. 17 DSGVO und § 35 BDSG von uns die Löschung Ihrer personenbezogenen Daten zu verlangen.
  - Sie haben das Recht, nach Maßgabe des Art. 18 DSGVO die Verarbeitung Ihrer personenbezogenen Daten einschränken zu lassen.
  - Sie haben das Recht, nach Maßgabe des Art. 20 DSGVO die Sie betreffenden personenbezogenen Daten, die Sie uns bereitgestellt haben, in einem strukturierten, gängigen und maschinenlesbaren Format zu erhalten und diese Daten einem anderen Verantwortlichen zu übermitteln.
  - Sie haben nach Maßgabe des Art. 21 Abs. 1 DSGVO das Recht, gegen jede Verarbeitung, die auf der Rechtsgrundlage des Art. 6 Abs. 1 Buchst. e) oder f) DSGVO beruht, Widerspruch einzulegen. Sofern durch uns personenbezogene Daten über Sie zum Zweck der Direktwerbung verarbeitet werden, können Sie gegen diese Verarbeitung gem. Art. 21 Abs. 2 und Abs. 3 DSGVO Widerspruch einlegen.

Sofern Sie uns eine gesonderte Einwilligung in die Datenverarbeitung erteilt haben, können Sie diese Einwilligung nach Maßgabe des Art. 7 Abs. 3 DSGVO jederzeit widerrufen. Durch einen solchen Widerruf wird die Rechtmäßigkeit der Verarbeitung, die bis zum Widerruf aufgrund der Einwilligung erfolgt ist, nicht berührt.
'''),
              ],
            ),
          ),
          Text('\nBeschwerde bei einer Aufsichtsbehörde\n',
              style: Theme.of(context).textTheme.headline6),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(text: '''
Wenn Sie der Ansicht sind, dass eine Verarbeitung der Sie betreffenden personenbezogenen Daten gegen die Bestimmungen der DSGVO verstößt, haben Sie nach Maßgabe des Art. 77 DSGVO das Recht auf Beschwerde bei einer Aufsichtsbehörde.
'''),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text('Datenschutzerklärung widerrufen'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Wrap(
                        children: [
                          ListTile(
                            title: Text(
                              'Datenschutzerklärung widerrufen',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Sind Sie sicher, dass sie diese Einstellung vornhemen wollen?\nSie werden nun aus der Applikation ausgeloggt.\n\n',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          ListTile(
                            title: TextButton(
                              child: Text('Datenschutzerklärung widerrufen'),
                              onPressed: () {
                                this
                                    .auth
                                    .logoutAction()
                                    .then((value) => this.logoutCallback());
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          ListTile(
                            title: TextButton(
                              child: Text('Abbrechen'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
