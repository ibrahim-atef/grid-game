import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/view/screens/first_screen.dart';
 import 'package:game/view/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: '--`',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

//home:  SplashScreen(),
    );
  }
} //
