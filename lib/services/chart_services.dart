import 'dart:ui';

import 'package:candly/widgets/accessoryWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartServices {
  ChartServices(BuildContext context) {
    lineController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onWebResourceError: (WebResourceError error) {
            AccessoryWidgets.snackBar(context, error.description);
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://boisterous-starburst-d0d61b.netlify.app'));



    candleController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onWebResourceError: (WebResourceError error) {
            AccessoryWidgets.snackBar(context, error.description);
          },
        ),
      )
      ..loadRequest(Uri.parse('https://comforting-fairy-acf90a.netlify.app/'))..enableZoom(true)..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  late WebViewController lineController;
  late WebViewController candleController;

}
