import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewClass extends StatefulWidget {
  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    //  String url = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
      body: WebView(
        initialUrl: ModalRoute.of(context).settings.arguments,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          debugPrint(
              'webviewURL: ${ModalRoute.of(context).settings.arguments}');
        },
      ),
    );
  }
}
