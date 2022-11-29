import 'package:candly/widgets/auth_widgets/otp_request._widget.dart';
import 'package:candly/widgets/auth_widgets/otp_verification_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isOtpVerScreen = false;
  String? phoneNo;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    print(mediaQuery.width);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: mediaQuery.height * .8,
              width: mediaQuery.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/login_screen_image.png"))),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: mediaQuery.height * .08),
                  child: Text(
                    "Candly",
                    style: TextStyle(
                        fontFamily: "Array",
                        fontSize: mediaQuery.height * .0614,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(

                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuery.height * .015,
                        vertical: mediaQuery.height * .013),
                    width: mediaQuery.width * .962,
                    height: isOtpVerScreen
                        ? mediaQuery.height * .3841
                        : mediaQuery.height * .3,
                    duration: const Duration(milliseconds: 50),
                    child: Card(

                        color: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Theme.of(context).selectedRowColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: isOtpVerScreen? OtpVerification(backButton: (){

                          setState(() {
                            isOtpVerScreen = false;
                          });
                        },phoneNo: phoneNo):OtpRequest(reqOtp: (value) {
                          phoneNo = value;
                          setState(() {
                            isOtpVerScreen = true;
                          });

                        }))))
          ],
        ),
      ),
    );
  }
}
