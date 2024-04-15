import 'package:ecommece2/widgets/appbarC.dart';
import 'package:flutter/material.dart';

class favorite_Screen extends StatelessWidget {
  const favorite_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(
        title: const Text("favorite Item"),
        backgroundcolor: Colors.red,
      ),
    );
  }
}
