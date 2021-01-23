import 'package:flutter/material.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/archiv.dart';

List<int> top = [];
List<int> bottom = [0];

class ChooseArchivPublication extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChooseArchivPublication> {
  final List<int> subscription_id = <int>[
    3806089,
    3806218,
    5833185,
    5833979,
    5833173,
    5833984,
    5833972,
    3806087
  ];

  final List<String> names = <String>[
    'Rebland Kurier',
    'Wochenblatt',
    'Kaiserstühler Wochenbericht',
    'Breisgauer Wochenbericht',
    'Emmendinger Tor',
    'Elztäler Wochenbericht',
    'Von Haus zu Haus Denzlingen',
    'Von Haus zu Haus Ettenheim'
  ];

  final List<String> gebiet = <String>[
    'Ausgaben 100 - 300',
    'Ausgabe 400 - 700',
    'Ausgabe Stadt | Land',
    'Hauptausgabe',
    'Hauptausgabe',
    'Waldkirch | Elztal',
    'Ausgabe Stadt | Land',
    'Ausgabe Stadt | Land'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Archivausgaben',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 70.0),
            itemCount: subscription_id.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 44,
                    maxHeight: 44,
                  ),
                  child: Icon(Icons.wysiwyg),
                  //   child: Image.asset('rebland_kopf.png', fit: BoxFit.cover),
                ),

                // leading: FlutterLogo(size: 56.0),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Color.alphaBlend(Colors.orange, Colors.orange[50]),
                ),
                title: Text(
                  '${names[index]}',
                  style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ArchivAusgaben(),
                          settings: RouteSettings(
                              arguments: subscription_id[index])));
                },
                subtitle: Text(
                  '${gebiet[index]}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ));
            }));
  }
}
