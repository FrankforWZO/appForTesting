import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/aktuelle_ausgaben.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/carousel.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/chooseArchiv.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/kalkulator.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/news.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/preisliste.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 70.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.wysiwyg_sharp, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.poll_rounded, size: 30),
          Icon(Icons.call_split, size: 30),
        ],
        color: Colors.grey,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsList()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AktuelleAusgaben()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChooseArchivPublication()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Kalkulator()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreisList()),
            );
          }
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Center(
        child: FullscreenSliderDemo(),
      ),
    );
  }
}
