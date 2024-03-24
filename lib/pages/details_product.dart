import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommece2/widgets/appbarC.dart';
import 'package:flutter/material.dart';

class Details_Product extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? product;
  const Details_Product({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(),
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
              color: Colors.grey,
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
                Text(
                  product?["name"],
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.green,
                      size: 30,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product?["discount_price"],
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
                Text(
                  product?["original_price"],
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Buy ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
