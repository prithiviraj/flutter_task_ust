import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String link;

  WebViewScreen({Key key, @required this.link}) : super(key: key);

  @override
  WebViewScreenState createState() {
    return WebViewScreenState(link: link);
  }
}

class WebViewScreenState extends State<WebViewScreen> {
  final String link;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewScreenState({Key key, @required this.link});

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WebViewScreen",
        theme: ThemeData(),
        debugShowCheckedModeBanner: Constants.isDebugShowCheckedModeBanner,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56),
            child: Visibility(
              visible: false,
              child: AppBar(),
            ),
          ),
          body: Container(
            color: HexColor.fromHex("#141D28"),
            height: double.infinity,
            width: double.infinity,
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: buildWebView(context, link)),
          ),
        ));
  }

  WebView buildWebView(BuildContext context, String link) {
    print("Link->" + link);
    return WebView(
      initialUrl: link,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        print("WebView is loading (progress : $progress%)");
      },
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
