import 'package:ecommece2/auth/register.dart';
import 'package:ecommece2/controllers/auth_controllers.dart';
import 'package:ecommece2/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/appcolors.dart';
import '../widgets/appbarC.dart';
import '../widgets/buttonC.dart';
import '../widgets/textfieldC.dart';
import '../widgets/title_subtitleC.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(Auth_Controller());

    return Scaffold(
      backgroundColor: AppColors.navy_,
      appBar: const AppBarC(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Image--->>
                    Image.asset(
                      'assets/images/auth_.png',
                      width: width / 2,
                    ),

                    //TextField--->>
                    const Title_SubtitleC(
                        title: "Welcome Back!",
                        subtitle:
                            "Enter your email address and password to get access your account"),
                    const SizedBox(height: 30),

                    //TextField--->>
                    Column(
                      children: [
                        TextFieldC(
                          hinttext: "email",
                          isrequired: true,
                          onchanged: (email) => controller.email.value = email,
                        ),
                        const SizedBox(height: 20),

                        //TextField--->>
                        TextFieldC(
                          hinttext: "password",
                          issecured: true,
                          isrequired: true,
                          icon: Icons.remove_red_eye,
                          onchanged: (password) =>
                              controller.password.value = password,
                        ),
                        const SizedBox(height: 20),

                        //Reset Password--->>
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Reset password?",
                            style: TextStyle(
                                color: Colors.indigo,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.indigo),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Button--->>
                        Obx(
                          () => ButtonC(
                            text: "Login",
                            backgroundColor: Colors.grey,
                            isloading: controller.isloading.value,
                            ontap: () {
                              controller.logIn();
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => Get.to(() => Regester()),
                        child: const Text(
                          "Create new account?",
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
