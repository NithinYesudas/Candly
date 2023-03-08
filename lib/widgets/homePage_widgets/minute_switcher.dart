import 'package:candly/helpers/custom_colors.dart';
import 'package:flutter/material.dart';

class MinuteSwitcher extends StatefulWidget {
  final String value1;
  final String value2;

  const MinuteSwitcher({super.key, required this.value1, required this.value2});

  @override
  MinuteSwitcherState createState() => MinuteSwitcherState();
}

class MinuteSwitcherState extends State<MinuteSwitcher> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.distance > 4) {
          setState(() {
            _isSwitched = !_isSwitched;
          });
        }
      },
      onTap: () {
        setState(() {
          _isSwitched = !_isSwitched;
        });
      },
      child: Container(
        height: mediaQuery.height * .055,
        width: mediaQuery.width * .5,
        decoration: BoxDecoration(
          color: CustomColors.surface3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 13,
              right: 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.value1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Khand"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.value2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          fontFamily: "Khand"),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              left: _isSwitched ? mediaQuery.height * .1 : 0,
              right: _isSwitched ? 0 : mediaQuery.height * .1,
              child: Container(
                width: mediaQuery.width * .2,
                decoration: BoxDecoration(
                  color: CustomColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _isSwitched ? widget.value2 : widget.value1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "khand"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
