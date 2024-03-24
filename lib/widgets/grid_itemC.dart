import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommece2/pages/details_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product_Grid extends StatelessWidget {
  const Product_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final product = snapshot.data!.docs;
          return GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.to(Details_Product(
                      product: product[index],
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black54)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "30% off",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border))
                          ],
                        ),
                        Image.network(
                          product[index]["image"],
                          height: 100,
                        ),
                        Text(
                          product[index]["name"],
                          style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product[index]["discount_price"],
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Text(
                              product[index]["original_price"],
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
