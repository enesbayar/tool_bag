import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/widget_model/pages_widget_model.dart';
import '../widgets/classic_text.dart';

class SearchPage extends StatefulWidget {
  final String url;

  SearchPage(this.url);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  WebViewController _tempController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handleBackButton(context),
      child: Scaffold(
        appBar: AppBar(
          title: ClassicText(
            text: widget.url,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: WebView(
          initialUrl: PagesWidgetModel().googleSearchLink + widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.future.then((value) => _tempController = value);
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }

  Future<bool> _handleBackButton(BuildContext context) async {
    if (await _tempController.canGoBack()) {
      _tempController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
