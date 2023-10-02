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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("Your score is ${c.initialScore}")],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .65,
                  width: Get.width * .9,
                  child: GridView.builder(
                    physics:
                        ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      return c.xNum! == index
                          ? InkWell(
                              onTap: () {
                                c.chooseRightColor();
                              },
                              child: Container(
                                color: c.xColor!.withOpacity(.88),
                              ),
                            )
                          : InkWell(
                              child: Container(
                                color: c.xColor!,
                              ),
                            );
                    },
                    itemCount: c.initialGridCount,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
