import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryC extends StatelessWidget {
  const CategoryC({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("category").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                primary: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final categorys = snapshot.data!.docs[index];
                  return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(20),
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: Colors.black12)),
                      child: Image.network(categorys["icon"]));
                }),
          );
        });
  }
}
