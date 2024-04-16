import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommece2/widgets/appbarC.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class Payment_Screen extends StatelessWidget {
  const Payment_Screen(
      {super.key, required this.items, required this.totalPrice});
  final double totalPrice;
  final List<DocumentSnapshot> items;

  @override
  Widget build(BuildContext context) {
    final flutterBkash = FlutterBkash();
    return Scaffold(
      appBar: AppBarC(
        title: const Text(" Product Payment "),
        backgroundcolor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              onTap: (){
                flutterBkash.pay(context: context, amount: totalPrice, merchantInvoiceNumber: "merchantInvoiceNumber");
              },
              leading: Image.network(
                  "https://freelogopng.com/images/all_img/1656235199bkash-logo-transparent.png"),
              title: const Text("bKash Payment"),
              subtitle: const Text("pay with bKash"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ),
          )
        ],
      ),
    );
  }
}
