import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'file:///C:/FlutterApps/rssfee_parsing_tuts-master/lib/news_model.dart';
import 'package:webfeed/webfeed.dart';
import 'webview.dart';
import 'package:intl/intl.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  static String rssUrl = 'https://www.wzo.de/home?type=9818';

  String formatDate(DateTime pubDate) =>
      new DateFormat('EEE, d/M/y').format(pubDate);

  Future<List<NewsModel>> fetchNews() async {
    final _response = await http.get(rssUrl);

    if (_response.statusCode == 200) {
      var _decoded = new RssFeed.parse(_response.body);

      return _decoded.items
          .map((item) => NewsModel(
                link: item.link,
                pubDate: item.pubDate,
                title: item.title,
                description: item.description,
                enclosure: item.enclosure.url,
              ))
          .toList();
    } else {
      throw HttpException('Fehler beim Laden der Daten');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // icon: Image.asset('assets/logo.png'),),
          icon: Icon(Icons.av_timer),
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'Aktuelle Meldungen',
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: fetchNews(),
        builder: (context, snap) {
          if (snap.hasData) {
            final List<NewsModel> _news = snap.data;
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 70.0),
              itemBuilder: (context, i) {
                final NewsModel _item = _news[i];

                return Card(
                    child: ListTile(
                  hoverColor: Colors.orange[200],
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 70,
                      minHeight: 70,
                      maxWidth: 70,
                      maxHeight: 70,
                    ),
                    child: Container(
                        //child: Image.network('${_item.enclosure}'),
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                                margin: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(20, 0, 0, 0),
                                          blurRadius: 5.0,
                                          offset: Offset(6.0, 6.0))
                                    ],
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            '${_item.enclosure}')))))),
                  ),
                  trailing: Wrap(spacing: 5, children: <Widget>[
                    Icon(Icons.arrow_right,
                        color:
                            Color.alphaBlend(Colors.orange, Colors.orange[50])),
                    // Text('${'...weiter'}'),
                    // DateFormat.yMd().format(DateTime.parse(_item.pubDate))}'),
                    // (DateTime pubDate) => new DateFormat('EEE, M/d/y').format(pubDate),
                    //DateFormat('E, dd MMM yyyy HH:mm:ss zzz').parse(_item.pubDate)}'),
                    // _item.pubDate}'),
                  ]),
                  focusColor: Colors.orange,
                  title: Text(
                    '${_item.title}',
                    style:
                        TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${_item.description}',
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                    overflow: TextOverflow.fade,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => WebViewClass(),
                            settings: RouteSettings(arguments: _item.link)));
                  },
                ));
              },
              itemCount: _news.length,
            );
          } else if (snap.hasError) {
            return Center(
              child: Text(snap.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
