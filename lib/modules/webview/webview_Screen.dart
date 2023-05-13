import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
     String ?url;
    WebViewScreen({super.key,this.url,});
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: WebViewWidget(
          controller: WebViewController()
            ..setNavigationDelegate(
              NavigationDelegate(
                onNavigationRequest: (NavigationRequest request){
                  return NavigationDecision.navigate;
                },
              ),
            )..loadRequest(Uri.parse(url!))
        ),
      );
    }
  }
