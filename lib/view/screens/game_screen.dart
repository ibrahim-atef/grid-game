import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/logic/main_controller.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  final c = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Grid Game'),
      ),
      body: GetBuilder<MainController>(
        builder: (_) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox(
                    height: Get.height * .15,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Your score is ${c.initialScore}"),
                          c.highestScore == 0
                              ? Text("")
                              : Text("highest score is ${c.highestScore}")
                        ],
                      ),
                    ),
                  ),
                ),
                c.loseGame
                    ? SizedBox(
                        height: Get.height * .65,
                        width: Get.width * .9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(
                                "your score is ${c.initialScore} \n try better nexet time ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                c.playNewGame();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Play Again",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: Get.height * .65,
                        width: Get.width * .9,
                        child: GridView.builder(
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemBuilder: (context, index) {
                            return c.xNum! == index
                                ? InkWell(
                                    onTap: () {
                                      c.chooseRightColor();
                                    },
                                    child: Container(
                                      color: c.xColor!.withOpacity(.82),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      c.highestScore! < c.initialScore
                                          ? c.addHeightScore(c.initialScore)
                                          : null;
                                      c.loseGA();
                                    },
                                    child: Container(
                                      color: c.xColor!,
                                    ),
                                  );
                          },
                          itemCount: c.initialGridCount,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 5,
                            crossAxisCount: sqrt(c.initialGridCount).toInt(),
                          ),
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
