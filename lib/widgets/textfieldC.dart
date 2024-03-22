import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldC extends StatelessWidget {
  TextFieldC(
      {super.key,
      required this.hinttext,
      this.issecured,
      this.icon,
      this.onchanged,
      this.isrequired});
  final String hinttext;
  final bool? issecured;
  final bool? isrequired;
  final IconData? icon;
  final onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      obscureText: issecured ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.shade400,
        hintText: hinttext,
        prefixIcon: Icon(icon ?? Icons.email_outlined),

        //enable-->
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none),

        //focus-->
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color:
                  Colors.black), // Set border color when the field is focused
          borderRadius: BorderRadius.circular(14.0),
        ),

        //focus-->
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.red), // Set border color when the field is focused
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
