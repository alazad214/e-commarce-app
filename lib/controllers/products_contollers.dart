import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Product_Contoller extends GetxController {
  RxInt selectIndex = RxInt(0);
  RxString selectSize = RxString("");

  RxList sizes = [].obs;

  final user = FirebaseAuth.instance.currentUser!;

  addToCard(QueryDocumentSnapshot product) {
    FirebaseFirestore.instance
        .collection("cards")
        .doc(user.email)
        .collection("card")
        .add({
      "email": user.email,
      "product id": product.id,
      "name": product["name"],
      "image": product["image"],
      "o_price": product["o_price"],
      "d_price": product["d_price"],
      'variant': selectSize.value,
      "quantity": 1
    }).then((value) => Get.snackbar(
            "Successfully", "Product seccessfully added to card",
            snackPosition: SnackPosition.BOTTOM));
  }
}
