import 'package:candly/widgets/auth_widgets/otp_request.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

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
            OtpRequest()
          ],
        ),
      ),
    );
  }
}
