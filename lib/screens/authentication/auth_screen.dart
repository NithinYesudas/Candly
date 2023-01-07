import 'dart:async';

import 'package:candly/services/authentication_services/firebase_auth_service.dart';
import 'package:candly/widgets/auth_widgets/otp_request._widget.dart';
import 'package:candly/widgets/auth_widgets/otp_verification_widget.dart';
import 'package:candly/widgets/accessoryWidgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/custom_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isConnected = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    super.initState();
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  bool isOtpVerScreen = false;
  String phoneNo = "";
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print(result.name);
    if(result.name == "none" && isConnected){
      isConnected = false;
      AccessoryWidgets.snackBar(context, "You're Offline",bgColor: Colors.redAccent);

    }
    else if(!isConnected){
      isConnected = true;
      AccessoryWidgets.snackBar(context, "Back Online",bgColor: Colors.lightGreen);



    }
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.background,
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
                        color: CustomColors.surface2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2,
                                color: CustomColors.surface3),
                            borderRadius: BorderRadius.circular(10)),
                        child: isOtpVerScreen? OtpVerification(backButton: (){

                          setState(() {
                            isOtpVerScreen = false;
                          });
                        },phoneNo: phoneNo):OtpRequest(reqOtp: (value) async{
                          await FirebaseAuthService.requestOtp(value, context);
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
