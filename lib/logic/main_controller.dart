import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  int initialGridCount = 4;
  int? lastHighScore;
  int? highestScore ;
  bool loseGame = false;
  final GetStorage storage = GetStorage();
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
    getHighScore();
    super.onInit();
  }

  Color randomColor() {
    return xColor = allColors[Random().nextInt(allColors.length)];
  }

  int randomNom() {
    return xNum = Random().nextInt(initialGridCount);
  }

  addHeightScore(int score) async {
    await storage.write("score", score);
    update();
  }

  getHighScore() async {
    highestScore = await storage.read("score") ?? 0;
    print(highestScore);

    update();
  }

  loseGA() {
    loseGame = true;
getHighScore();
    update();
  }

  chooseRightColor() {
    initialScore += 1;

    /// nice code if choose the right color hhhh
    initialGridCount = pow(sqrt(initialGridCount).toInt() + 1, 2).toInt();
    randomNom();
    randomColor();
    update();
  }

  playNewGame() {
     initialGridCount = 4;

      loseGame = false;

     initialScore = 0;
     randomNom();
     randomColor();
     getHighScore();
    update();

  }
}
