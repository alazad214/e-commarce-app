import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommece2/controllers/card_controllers.dart';
import 'package:ecommece2/widgets/appbarC.dart';
import 'package:ecommece2/widgets/buttonC.dart';
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
                        fontSize: 20),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Card_Controller().Add_toCard(product!);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                      size: 30,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        fontSize: 22),
                  ),
                ),
                Text(
                  product?["o_price"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 22),
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
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: ButtonC(
                text: "Buy",
                backgroundColor: Colors.green,
              ))
        ],
      )),
    );
  }
}
