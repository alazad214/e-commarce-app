import 'package:ecommece2/pages/card_screen.dart';
import 'package:ecommece2/pages/favorite_screen.dart';
import 'package:ecommece2/widgets/categoryC.dart';
import 'package:ecommece2/widgets/Cus_single_product.dart';
import 'package:ecommece2/widgets/title_subtitleC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/sliders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const Card_Screen());
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () {
                Get.to(const favorite_Screen());
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
              Cus_Single_Product()
            ],
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
