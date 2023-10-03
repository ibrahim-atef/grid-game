import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'game_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => FirstScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/grid_animation.json'),
            SizedBox(
              height: 20,
            ),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  'G - GAME',
                  textStyle:
                      TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,color: Colors.indigo),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
