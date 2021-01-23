import 'package:flutter/material.dart';
import 'webview.dart';
import 'calameo_reader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';


var way = 'DOWN';
var order = 'Creation';

class MediaDataList extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    debugPrint('subscription_id: ${ModalRoute.of(context).settings.arguments}');

    //var subscription_id = ModalRoute.of(context).settings.arguments;
  }
}

class MediaData extends StatefulWidget {
  @override
  _MediaDataState createState() => _MediaDataState();
}

class _MediaDataState extends State<MediaData> {
  Future<List<CalameoModel>> fetchPosts() async {
    int ausgabenummer = 6483751;

    //  var subscription_id = ModalRoute.of(context).settings.arguments;
    var step = 22;
    var publicKey = 'b9c48a41a9994de0b529c8c30c9e7da9';
    var privateKey = 'tjvYQRVF3KAciEsKKMbqz8CWR3Jy3tXcETA9lWZsHaVPePaO';
    var fetchSubscriptionBooks = utf8.encode('$privateKey'
        'actionAPI.fetchSubscriptionBooksapikey$publicKey'
        'order$order'
        'outputJSON'
        'step$step'
        'subscription_id$ausgabenummer'
        'way$way');
    var digest = md5.convert(fetchSubscriptionBooks);

    String calameoURL =
        'https://api.calameo.com/1.0?apikey=$publicKey&action=API.fetchSubscriptionBooks&order=$order&output=JSON&step=$step&subscription_id=$ausgabenummer&way=$way&signature=$digest';

    // int subscription_id = ModalRoute.of(context).settings.arguments;

    http.Response response = await http.get(calameoURL);
    var responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      print('${response.runtimeType} : $responseJson');
      return (responseJson['response']['content']['items'] as List)
          .map((p) => CalameoModel.fromJson(p))
          .toList();
    } else {
      throw _MediaDataState;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          "Sonderausgaben",
          style: TextStyle(
              color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: fetchPosts(),
        builder: (context, snap) {
          if (snap.hasData) {
            final List<CalameoModel> _news = snap.data;
            return ListView.builder(
              itemBuilder: (context, i) {
                final CalameoModel _item = _news[i];
                return Card(
                    child: ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 44,
                      maxHeight: 44,
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
                                            '${_item.posterUrl}')))))),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Color.alphaBlend(Colors.orange, Colors.orange[50]),
                  ),
                  focusColor: Colors.orange,
                  // trailing: Text('${_item.pubDate}'),
                  title: Text(
                    '${_item.name} | ${_item.date} ',
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),
                  ),

                  subtitle: Text(
                    '${_item.description}',
                    maxLines: 10,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                  ),

                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => WebViewClass(),
                            settings: RouteSettings(arguments: _item.viewURL)));
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
