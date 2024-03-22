import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/appcolors.dart';

class ButtonC extends StatelessWidget {
  final String text;
  final ontap;
  final Color? backgroundColor;
  final Color? textcolor;
  final bool? isloading;
  const ButtonC({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textcolor,
    this.ontap,
    this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.color_4,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isloading == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Loading..",
                      style: TextStyle(
                          color: textcolor ?? Colors.white, fontSize: 18),
                    )
                  ],
                )
              : Text(
                  text,
                  style:
                      TextStyle(color: textcolor ?? Colors.white, fontSize: 22),
                ),
        ),
      ),
    );
  }
}
