import 'package:flutter/material.dart';

class OtpRequest extends StatelessWidget {
  OtpRequest({Key? key}) : super(key: key);
String? phoneNo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery
        .of(context)
        .size;
    return Positioned(
        bottom: 0,
        child: Container(
            margin: EdgeInsets.all(mediaQuery.height * .015),
            width: mediaQuery.width * .95,
            height: mediaQuery.height * .3,
            child: Card(
              color: Theme
                  .of(context)
                  .cardColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2, color: Theme
                      .of(context)
                      .selectedRowColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
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
                    //margin: EdgeInsets.symmetric(horizontal: 60),
                    child: TextField(
                     onChanged: (value){
                       phoneNo = value;
                     },
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "khand",
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme
                              .of(context)
                              .selectedRowColor,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType: TextInputType.phone,

                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if (phoneNo == null || phoneNo!.length < 10) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content:  Text("Please enter a valid phone no",
                                style: TextStyle(fontFamily: "Khand"),)));
                        }
                      },
                      child: Container(

                        width: mediaQuery.width * .657,
                        height: mediaQuery.height * .0614,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                  Theme
                                      .of(context)
                                      .primaryColorDark
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
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
              ),
            )));
  }
}
