import 'package:candly/services/chart_services.dart';
import 'package:candly/widgets/homePage_widgets/percentage_indicator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helpers/custom_colors.dart';

class ListChartsTrans extends StatelessWidget {
   ListChartsTrans({Key? key}) : super(key: key);
  Widget divider =  const Divider(color: Colors.white60,height: 0,);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
              height: mediaQuery.height * .12,
              width: double.infinity,
              child: WebViewWidget(
                controller: ChartServices().lineController,
              )),
       divider,
          SizedBox(
            height: mediaQuery.height * .08,
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
          Container(
            height: mediaQuery.height * .18,
          ),
          //for the candle chart
          Container(
            height: mediaQuery.height * .13,
            padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * .05,
                vertical: mediaQuery.height * .008),
            child: Column(
              children: [
                SizedBox(
                    height: mediaQuery.height * .03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "30%",
                          style: TextStyle(
                              fontFamily: "Khand",
                              color: Colors.white,
                              fontSize: mediaQuery.width * .05),
                        ),
                        Text(
                          "70%",
                          style: TextStyle(
                              fontFamily: "Khand",
                              color: Colors.white,
                              fontSize: mediaQuery.width * .05),
                        )
                      ],
                    )),
                const PercentageIndicator(),
                SizedBox(
                  height: mediaQuery.height * .02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "35% returns",
                        style: TextStyle(
                            fontFamily: "Khand",
                            color: Colors.white70,
                            fontSize: mediaQuery.width * .04),
                      ),
                      Text(
                        "65% returns",
                        style: TextStyle(
                            fontFamily: "Khand",
                            color: Colors.white70,
                            fontSize: mediaQuery.width * .04),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
         divider
        ],
      ),
    );
  }
}
