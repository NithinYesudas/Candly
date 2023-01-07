import 'dart:async';

import 'package:candly/services/authentication_services/firebase_auth_service.dart';
import 'package:candly/widgets/accessoryWidgets.dart';
import 'package:flutter/material.dart';

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton(this.phoneNo, {super.key});

  final String phoneNo;

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Timer? _timer;
  bool isOtpTimeOver = false;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            isOtpTimeOver = true;
            _timer!.cancel();
          });
        } else {
          _start--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return TextButton(
      //to check if resend timer is over i.e 30 seconds
        onPressed: !isOtpTimeOver
            ? () {
                AccessoryWidgets.snackBar(context,
                    "Retry after ${(30 - _timer!.tick).toString()} seconds");
              }
            : () {
                FirebaseAuthService.resendOtp(widget.phoneNo, context);
              },
        child: Text(
          "Resend Code",
          style: TextStyle(
              fontFamily: "Khand",
              fontWeight: FontWeight.w600,
              fontSize: mediaQuery.width * .0456,
              color: isOtpTimeOver
                  ? Theme.of(context).primaryColor
                  : Colors.white54),
        ));
  }
}
