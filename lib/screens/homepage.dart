import 'package:candly/helpers/candly_icons_icons.dart';
import 'package:candly/helpers/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WebViewController lineChartController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse('https://luminous-hummingbird-98cda0.netlify.app/'));
  final WebViewController candleController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://comforting-fairy-acf90a.netlify.app/'));

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    print(mediaQuery.width);
    print(mediaQuery.height);
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
          toolbarHeight: mediaQuery.height * .11,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: CustomColors.background,

            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: CustomColors.background,
          title: Text(
            "Candly",
            style: TextStyle(
                fontFamily: "Array", fontSize: mediaQuery.height * .04),
          ),
          actions: [
            Padding(
                padding:
                    EdgeInsets.symmetric(vertical: mediaQuery.height * .03),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: mediaQuery.width * .02)),
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors.surface1)),
                  label: const Text(
                    "\$500",
                    style: TextStyle(
                        fontFamily: "Khand", fontWeight: FontWeight.w600),
                  ),
                  icon: SizedBox(
                      width: mediaQuery.width * .07,
                      child: Image.asset(
                        "assets/images/coin.png",
                        fit: BoxFit.contain,
                      )),
                )),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: mediaQuery.width * .057,
                  vertical: mediaQuery.height * .03),
              height: mediaQuery.height * .055,
              width: mediaQuery.width * .13,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors.surface1)),
                  child: const Icon(CandlyIcons.property_1_account)),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: mediaQuery.height * .13,
              child: WebViewWidget(
                controller: lineChartController,
              ),
            ),
            SizedBox(
              height: mediaQuery.height * .09,
              width: double.infinity,
              child: ListTile(
                title: Text(
                  "Current Investment: \$500",
                  style: TextStyle(
                      fontFamily: "Array",
                      color: Colors.white,
                      fontSize: mediaQuery.width * .05),
                ),
                trailing: Container(
                  height: mediaQuery.height * .05,
                  width: mediaQuery.width * .13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CustomColors.primary),
                  child: const Center(
                    child: Text(
                      "59 sec",
                      style: TextStyle(fontFamily: 'Khand',color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: mediaQuery.height * .22,
                child: WebViewWidget(controller: candleController))
          ],
        ));
  }
}
