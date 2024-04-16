import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommece2/controllers/products_contollers.dart';

import 'package:ecommece2/pages/card_screen.dart';
import 'package:ecommece2/widgets/appbarC.dart';
import 'package:ecommece2/widgets/buttonC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details_Product extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? product;
  const Details_Product({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Product_Contoller());
    return Scaffold(
      appBar: AppBarC(
        backgroundcolor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              product?['image'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product?["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product?["d_price"],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Text(
                  product?["o_price"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Discription",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              product?["dis"],
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        .doc(product!.id)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                            itemCount: snapshot.data!.data()!['sizes'].length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Obx(() => InkWell(
                                    onTap: () {
                                      controller.selectIndex.value = index;
                                      controller.selectSize.value = snapshot
                                          .data!
                                          .data()!['sizes'][index]
                                          .toString();
                                    },
                                    child: Container(
                                      width: 40,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: controller.selectIndex.value ==
                                                index
                                            ? Colors.green
                                            : null,
                                        border: Border.all(
                                          color: Colors.black.withOpacity(.1),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          snapshot.data!
                                              .data()!['sizes'][index]
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      );
                    })
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                      child: ButtonC(
                    ontap: () {
                      Product_Contoller().addToCard(product!);
                    },
                    text: "Add to card",
                    backgroundColor: Colors.green,
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ButtonC(
                    ontap: () {
                      Get.to(Cart_Screen());
                    },
                    text: "Buy Now",
                    backgroundColor: Colors.blue,
                  ))
                ],
              ))
        ],
      )),
    );
  }
}
