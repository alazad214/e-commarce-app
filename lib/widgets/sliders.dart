import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderList extends StatelessWidget {
  const SliderList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("banner").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final banners = snapshot.data!.docs;
          return CarouselSlider.builder(
            itemCount: banners.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              height: 140,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(banners[itemIndex]['image']),
                      fit: BoxFit.cover)),
            ),
          );
        });
  }
}
