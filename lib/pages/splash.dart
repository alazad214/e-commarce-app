import 'package:ecommece2/pages/homepage.dart';
import 'package:ecommece2/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../const/appcolors.dart';
import '../const/appstrings.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      if (user == null) {
        Get.offAll(() => Welcome());
      } else
        Get.offAll(() => HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
        color: AppColors.navy_,
        child:  Center(
          child: Lottie.asset("assets/animation/anim.json",height: Height / 8 )
        ),
      ),
    );
  }
}
