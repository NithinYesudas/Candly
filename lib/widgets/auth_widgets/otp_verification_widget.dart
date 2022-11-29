import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification(
      {super.key, required this.backButton, required this.phoneNo});

  final Function backButton;
  final String? phoneNo;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
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
                fillColor: Theme.of(context).selectedRowColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            keyboardType: TextInputType.number,
          ),
        ),
        InkWell(
            onTap: () {},
            child: Container(
              width: mediaQuery.width * .6,
              height: mediaQuery.height * .0614,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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
        TextButton(
            onPressed: () {},
            child: Text(
              "Resend Code",
              style: TextStyle(
                  fontFamily: "Khand",
                  fontWeight: FontWeight.w600,
                  fontSize: mediaQuery.width * .0456,
                  color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }
}
