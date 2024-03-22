import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login.dart';
import '../auth/register.dart';
import '../const/appcolors.dart';
import '../widgets/buttonC.dart';
import '../widgets/title_subtitleC.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy_,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/welcome.png')),
                    const Title_SubtitleC(
                        title: "Discover your dream shopping here",
                        subtitle:
                            "Shop more and register the app to get all the vouchers in the app."),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonC(
                            text: "Login",
                            textcolor: Colors.lightBlue,
                            ontap: () => Get.to(() => LogIn()),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonC(
                            text: "Register",
                            backgroundColor: Colors.transparent,
                            textcolor: Colors.grey,
                            ontap: () => Get.to(() => Regester()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
