import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product_Grid extends StatelessWidget {
  const Product_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7),
        itemBuilder: (_, index) {
          return Container(
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
                Image.asset("assets/image_category/computer.png"),
                const Text(
                  "Book",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 500",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "\$ 500",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
