import 'package:flutter/material.dart';
import 'package:web_demo_app/Config/Urls.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<Homescreen> {

  bool isLoaded = false;

  WebViewController _webViewController  = new WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
   ..setNavigationDelegate(
       NavigationDelegate(
         onProgress: (int progress) {
           // Update loading bar.
         },
         onPageStarted: (String url) {

         },
         onPageFinished: (String url) {
         },
         onHttpError: (HttpResponseError error) {},
         onWebResourceError: (WebResourceError error) {},
         onNavigationRequest: (NavigationRequest request) {
           // if (request.url.startsWith('https://www.youtube.com/')) {
           //   return NavigationDecision.prevent;
           // }
           return NavigationDecision.navigate;
         },
      )
   )
  ..loadRequest(Uri.parse(Urls().ABOUT_US));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Web Demo App"),
        ),
        body: isLoaded ? CircularProgressIndicator() :
        WebViewWidget(controller: _webViewController)
    );
  }
}
