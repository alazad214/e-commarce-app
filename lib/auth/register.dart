import 'package:ecommece2/controllers/auth_controllers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/appcolors.dart';

import '../widgets/appbarC.dart';
import '../widgets/buttonC.dart';
import '../widgets/textfieldC.dart';
import '../widgets/title_subtitleC.dart';
import 'login.dart';

class Regester extends StatelessWidget {
  Regester({super.key});

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.navy_,

      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/auth_.png',
                      width: width / 2,
                    ),
                    const Title_SubtitleC(
                        title: "Sign Up!",
                        subtitle: "Just a few quick things to get started"),
                    const SizedBox(height: 30),
                    Form(
                      child: Column(
                        children: [
                          TextFieldC(
                            hinttext: "email",
                            onchanged: (email) {
                              controller.email.value = email;
                              print(controller.email.value = email);
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFieldC(
                              hinttext: "password",
                              issecured: true,
                              icon: Icons.remove_red_eye,
                              onchanged: (password) {
                                controller.password.value = password;
                              }),
                          const SizedBox(height: 20),
                          TextFieldC(
                              hinttext: " Confirm password",
                              issecured: true,
                              icon: Icons.remove_red_eye,
                              onchanged: (confirmpassword) {
                                controller.confirmpassword.value =
                                    confirmpassword;
                              }),
                          const SizedBox(height: 20),
                          Obx(
                            () => ButtonC(
                                text: "SignUp",
                                isloading: controller.isloading.value,
                                backgroundColor: Colors.grey,
                                ontap: () {
                                  controller.SignUp();
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => Get.to(() => LogIn()),
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
