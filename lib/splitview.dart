import 'package:flutter/material.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/mediadaten.dart';
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/news.dart';

import 'package:split_view/split_view.dart';
import 'carousel.dart';

class MySplit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WZO',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'WZO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo2.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            // Container(
            //    padding: const EdgeInsets.all(8.0), child: Text('Wochenzeitungen am Oberrhein'))
          ],
        ),

        //   title: Text(widget.title,style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),),
      ),
      body: SplitView(
        initialWeight: 0.3,
        view1: SplitView(
          viewMode: SplitViewMode.Horizontal,
          view1: Container(
            child: Center(child: FullscreenSliderDemo()),
            color: Colors.grey,
          ),

          view2: Container(
            child: Center(
              child: MediaData(),
            ),
            color: Colors.grey,
          ),
          //onWeightChanged: (w) => print("Horizon: $w"),
        ),

        //Newslistausgabe
        view2: Container(
          child: Center(
            child: NewsList(),
          ),
          color: Colors.grey,
        ),
        viewMode: SplitViewMode.Vertical,
        //   onWeightChanged: (w) => print("Vertical $w"),
      ),
    );
  }
}
