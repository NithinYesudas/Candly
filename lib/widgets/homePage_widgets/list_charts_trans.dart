import 'package:candly/services/chart_services.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helpers/custom_colors.dart';

class ListChartsTrans extends StatelessWidget {
   const ListChartsTrans({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        children: [
          SizedBox(

            height: mediaQuery.height * .15,

            width: double.infinity,
            child:  WebViewWidget(
              controller: ChartServices().lineController,

            )),


            SizedBox(
              height: mediaQuery.height * .09,
              width: double.infinity,
              child: ListTile(
                title: Text(
                  "Current Investment: \$500",
                  style: TextStyle(
                      fontFamily: "Array",
                      color: Colors.white,
                      fontSize: mediaQuery.width * .06),
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
                      style: TextStyle(fontFamily: 'Khand', color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
              height: mediaQuery.height * .22,

              child: WebViewWidget(controller: ChartServices().candleController)),//for the candle chart



        ],
      ),
    );

  }
}
