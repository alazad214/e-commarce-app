import 'package:ecommece2/widgets/appbarC.dart';

import 'package:flutter/material.dart';

class Card_Screen extends StatelessWidget {
  const Card_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(
        title: const Text("Added Card"),
        backgroundcolor: Colors.green,
      ),
    );
  }
}
