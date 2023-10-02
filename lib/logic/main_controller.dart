import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int initialGridCount = 4;
  int initialScore = 0;
  Color? xColor;
  int? xNum;
  List<Color> allColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    randomNom();
    randomColor();
    super.onInit();
  }

  Color randomColor() {
    return xColor = allColors[Random().nextInt(allColors.length)];
  }



  int randomNom() {
    return xNum = Random().nextInt(initialGridCount);
  }



  chooseRightColor() {
    initialScore += 1;
    initialGridCount=pow(sqrt(initialGridCount).toInt()+1,2).toInt();
    randomNom();
    randomColor();
    update();

  }
}
