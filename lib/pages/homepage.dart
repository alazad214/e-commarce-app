import 'package:ecommece2/widgets/appbarC.dart';
import 'package:ecommece2/widgets/categoryC.dart';
import 'package:ecommece2/widgets/grid_itemC.dart';
import 'package:ecommece2/widgets/title_subtitleC.dart';
import 'package:flutter/material.dart';

import '../widgets/sliders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarC(
          backgroundcolor: Colors.blueGrey,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          action: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title_SubtitleC(
                  title: "Hello Azad",
                  subtitle: "let's go to shopping",
                  textcolor1: Colors.cyan,
                ),
                SizedBox(height: 20),
                SliderList(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                CategoryC(),
                SizedBox(height: 20),
                Product_Grid()
              ],
            ),
          ),
        ));
  }
}
