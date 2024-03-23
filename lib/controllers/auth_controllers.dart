import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommece2/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../auth/profile_setup.dart';

class Auth_Controller extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  RxBool isloading = RxBool(false);

  RxString fullName = RxString('');
  RxString address = RxString('');
  RxString phoneNumber = RxString('');

  final auth = FirebaseAuth.instance;

  SignUp() async {
    if (password.value != confirmpassword.value) {
      Get.snackbar("Invalid password", "Password doesn't matched");
      return;
    }
    isloading.value = true;
    update();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        isloading.value = false;
        update();
        if (value.user != null) {
          Get.off(Profile_SetUp());
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  profileSetUp() async {
    final token = await FirebaseMessaging.instance.getToken();

    await FirebaseFirestore.instance
        .collection('users')
        .doc('document_id')
        .set({
      'email': email.value,
      'full_name': fullName.value,
      'address': address.value,
      'phone_number': phoneNumber.value,
      'token': token,
    });
    Get.offAll(() => const HomePage());
  }

  logIn() async {
    isloading.value = true;
    update();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        isloading.value = false;
        update();
        if (value.user != null) {
          Get.offAll(HomePage());
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }
}
