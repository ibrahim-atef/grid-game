import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorGridView extends StatefulWidget {
  @override
  _ColorGridViewState createState() => _ColorGridViewState();
}

class _ColorGridViewState extends State<ColorGridView> {
  // List to hold the colors of the grid cells
  double w = Get.width;
  Color? initColor;
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
  double h = Get.height;
  var maxGridNum = 20;

  var rIndex = Random().nextInt(20);
  var rIndex2 = Random().nextInt(20);

  @override
  void initState() {
    super.initState();
    // Generate initial colors for the grid cells
    print(rIndex);
    initColor = getRandomColor();
  }

  Color getRandomColor() {
    // Generate a random color
    return allColors[Random().nextInt(allColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Grid Game'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: h * .15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Your score is $rIndex")],
            ),
          ),
          SizedBox(
           height: h * .65,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      color: index == Random().nextInt(rIndex)
                          ? initColor!.withOpacity(.7)
                          : initColor,

                      /// height: h * .25,
                      /// width: w * .25,
                    ),
                  );
                },
                itemCount: 9),
          ),
        ],
      ),
      // body: GridView.count(
      //   crossAxisCount: 2, // Number of columns in the grid
      //   children: List.generate(colors.length, (index) {
      //     return GestureDetector(
      //       onTap: () {
      //         selectColor(colors[index]);
      //       },
      //       child: Container(
      //         color: colors[index],
      //       ),
      //     );
      //   }),
      // ),
    );
  }

  // void selectColor(Color selectedColor) {
  //   // Check if the selected color is different from the others
  //   bool isDifferent = false;
  //   for (Color color in colors) {
  //     if (getColorDifference(color, selectedColor) >= 50) {
  //       isDifferent = true;
  //       break;
  //     }
  //   }
  //
  //   if (isDifferent) {
  //     // Double the grid size and update the colors
  //     setState(() {
  //       colors.addAll(List.generate(4, (index) => getRandomColor()));
  //     });
  //   } else {
  //     // Penalize the player (e.g., decrease score)
  //     // Add your own logic here
  //   }
  // }

  double getColorDifference(Color color1, Color color2) {
    // Calculate the difference between two colors using Euclidean distance
    return sqrt(
      pow(color1.red - color2.red, 2) +
          pow(color1.green - color2.green, 2) +
          pow(color1.blue - color2.blue, 2),
    );
  }
}
