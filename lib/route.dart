import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/kalkulator.dart';

import 'chooseArchiv.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/splitview.dart';
import 'info.dart';
import 'choosePublication.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: MySplit(),
    ),
    MyRoute(
      iconData: Icons.vertical_split,
      page: ChoosePublication(),
    ),
    MyRoute(
      iconData: Icons.vertical_split_outlined,
      page: ChooseArchivPublication(),
    ),
    MyRoute(
      iconData: Icons.poll_rounded,
      page: Kalkulator(),
    ),
    MyRoute(
      iconData: Icons.perm_device_information,
      page: InfoClass(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 70.0,
        items: pages
            .map((p) => Icon(
                  p.iconData,
                  size: 30,
                ))
            .toList(),
        color: Colors.grey,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      backgroundColor: Colors.grey,
      body: pages[_pageIndex].page,
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}
