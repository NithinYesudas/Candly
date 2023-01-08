import 'package:candly/services/firebase_auth_service.dart';
import 'package:candly/widgets/auth_widgets/resendotpbutton.dart';
import 'package:candly/widgets/accessoryWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification(
      {super.key, required this.backButton, required this.phoneNo});

  final Function backButton;
  final String phoneNo;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mediaQuery.width * .1,
                  ),
                  IconButton(
                      onPressed: () {
                        widget.backButton();
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white70,
                      )),
                  Text(
                    "Verify OTP",
                    style: TextStyle(
                        fontFamily: "Array",
                        color: Colors.white70,
                        fontSize: mediaQuery.width * .058),
                  ),
                ],
              ),
              Text(
                "Enter 6 digit OTP sent to ${widget.phoneNo}",
                style: TextStyle(
                    fontFamily: "Khand",
                    color: Colors.white70,
                    fontSize: mediaQuery.width * .04),
              ),
              SizedBox(
                height: mediaQuery.height * .0614,
                width: mediaQuery.width * .6,
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "khand",
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColors.surface3,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.number,
                ),
              ),
              InkWell(
                  onTap: () async {
                    try {
                      //otp verification using verification id got from sending phone no
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId:
                                  FirebaseAuthService.verificationId,
                              smsCode: _controller.text.trim());

                      // Sign the user in (or link) with the credential
                      setState(() {
                        isLoading = true;
                      });

                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .whenComplete(() {
                        isLoading = false;
                      });
                    } on FirebaseAuthException catch (error) {
                      AccessoryWidgets.snackBar(
                          context, error.message as String);
                    }
                  },
                  child: Container(
                    width: mediaQuery.width * .6,
                    height: mediaQuery.height * .0614,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              CustomColors.primary,
                              CustomColors.primaryDark
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * .0153,
                        horizontal: mediaQuery.height * .046),
                    child: Text("Submit OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: mediaQuery.height * .021,
                            color: Colors.white,
                            fontFamily: "Khand",
                            fontWeight: FontWeight.w600)),
                  )),
              ResendOtpButton(widget.phoneNo)
            ],
          );
  }
}
