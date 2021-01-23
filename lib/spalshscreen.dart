import 'package:flutter/material.dart';
import 'route.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashMyApp extends StatefulWidget {
  @override
  _SplashMyAppState createState() => new _SplashMyAppState();
}

class _SplashMyAppState extends State<SplashMyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new BottomNavBar(),
      title: new Text(
        'einen Moment bitte...',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white60),
      ),
      image: new Image.asset(
        'assets/logoWZO.png',
        width:250,
        scale: 3.0,
        fit: BoxFit.contain,
      ),
      backgroundColor: Colors.black87,
      loaderColor: Colors.orange,
    );
  }
}
