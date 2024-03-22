import 'dart:ui';

import 'package:flutter/material.dart';

import '../const/appcolors.dart';

class Title_SubtitleC extends StatelessWidget {
  const Title_SubtitleC(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: AppColors.white_2),
        ),
      ],
    );
  }
}
