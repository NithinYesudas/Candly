import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class ControlCentre extends StatelessWidget {
  const ControlCentre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * .19,
      width: mediaQuery.width,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: CustomColors.surface3),
          color: CustomColors.surface2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        children: [
          SizedBox(
            width: mediaQuery.width * .55,
            child: Column(
              children: [
                
              ],
            ),
          ),
          SizedBox(
            width: mediaQuery.width * .4,
            child: Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                          top: mediaQuery.height * .03,
                          bottom: mediaQuery.height * .01),
                      height: mediaQuery.height * .055,
                      width: mediaQuery.width * .32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                              colors: [
                                CustomColors.green,
                                CustomColors.greenDark
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: Center(
                        child: Text(
                          "GREEN",
                          style: TextStyle(
                              fontFamily: "Khand",
                              color: Colors.white,
                              fontSize: mediaQuery.width * .042),
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: mediaQuery.height * .055,
                      width: mediaQuery.width * .32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                              colors: [CustomColors.red, CustomColors.redDark],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: Center(
                        child: Text(
                          "RED",
                          style: TextStyle(
                              fontFamily: "Khand",
                              color: Colors.white,
                              fontSize: mediaQuery.width * .042),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
