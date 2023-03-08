import 'package:candly/helpers/candly_icons_icons.dart';
import 'package:candly/helpers/custom_colors.dart';
import 'package:candly/widgets/homePage_widgets/control_center.dart';
import 'package:candly/widgets/homePage_widgets/list_charts_trans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  label:  Text(
                    "\$500",
                    style: TextStyle(
                      fontSize: mediaQuery.width*.05,
                        fontFamily: "Khand", fontWeight: FontWeight.w600),
                  ),
                  icon: SizedBox(
                      width: mediaQuery.width * .08,
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
              //Profile button
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
        body: Column(
          children:   [
            //Listview of charts, current investment, and list of transactions

             ListChartsTrans(),
            //Bottom Control Centre

           const ControlCentre()
          ],
        ));
  }
}
