import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class PercentageIndicator extends StatelessWidget {
  const PercentageIndicator({Key? key}) : super(key: key);
  static const double green = .3, red = .6;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
        height: mediaQuery.height * .05,
        child: Row(
          children: [
            Container(
              height: mediaQuery.height * .022,
              width: mediaQuery.width * (green - .05),
              decoration: BoxDecoration(
                  color: CustomColors.green,
                  borderRadius:
                     const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
            ),
            Container(
              height: mediaQuery.height * .05,
              width: mediaQuery.width * .1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColors.primary),
              child: Center(
                child: Text(
                  "VS",
                  style: TextStyle(
                      fontFamily: 'Array',
                      color: Colors.white,
                      fontSize: mediaQuery.width * .055),
                ),
              ),
            ),
            Container(
              height: mediaQuery.height * .022,
              width: mediaQuery.width * (red - .05),
              decoration: BoxDecoration(color: CustomColors.red, borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
            )
          ],
        ));
  }
}
