import 'package:flutter/material.dart';

class OtpRequest extends StatefulWidget {
  const OtpRequest({super.key, required this.reqOtp});

  final Function reqOtp;

  @override
  State<OtpRequest> createState() => _OtpRequestState();
}

class _OtpRequestState extends State<OtpRequest> {
  String phoneNo = "";

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Enter Your Phone Number",
          style: TextStyle(
              fontSize: mediaQuery.height * .021,
              color: Colors.white70,
              fontFamily: "Khand",
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: mediaQuery.height * .0614,
          width: mediaQuery.width * .657,
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
            keyboardType: TextInputType.phone,
          ),
        ),
        InkWell(
            onTap: () {

              if (_controller.text.isEmpty || _controller.text.length != 10) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  "Please enter a valid phone no",
                  style: TextStyle(fontFamily: "Khand"),
                )));
              } else {
                widget.reqOtp(_controller.text);
              }
            },
            child: Container(
              width: mediaQuery.width * .657,
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
              child: Text("REQUEST OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: mediaQuery.height * .021,
                      color: Colors.white,
                      fontFamily: "Khand",
                      fontWeight: FontWeight.w600)),
            ))
      ],
    );
  }
}
