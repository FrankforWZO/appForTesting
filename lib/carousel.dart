import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/preisliste.dart';

final List<String> imgList = [
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-0.jpg',
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-1.jpg',
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-2.jpg',
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-3.jpg',
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-4.jpg',
  'https://www.wzo.de/fileadmin/AppContent/Winter2/img-5.jpg'
];

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.fitHeight,
                        height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PreisList(),
                  settings:
                      RouteSettings(arguments: Icons.analytics_outlined)));
        },
        tooltip: 'Mediadaten',
        icon: Icon(Icons.analytics_outlined),
        label: Text(
          'Mediadaten',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.orange[600],
        elevation: 5.0,
      ),
    );
  }
}
