import 'package:flutter/material.dart';
import 'package:game/view/screens/home_screen.dart';

import 'first_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
          builder: (context) => FirstScreen()
      ) , (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
