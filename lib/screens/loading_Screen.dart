import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: mediaQuery.height * .8,
        width: mediaQuery.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_screen_image.png"))),
        child: Center(child: Text("Candly",style: TextStyle(fontFamily: "Array",fontSize: mediaQuery.width*.08,color: Colors.white),),),
      ),
    );
  }
}
