import 'package:candly/helpers/custom_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartServices {
  WebViewController lineController = WebViewController();
  WebViewController candleController = WebViewController();

  ChartServices() {
    lineController
      ..loadRequest(


          Uri.parse('https://spontaneous-phoenix-0fa069.netlify.app'))
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(CustomColors.background);



}}

