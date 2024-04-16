import 'package:ecommece2/widgets/appbarC.dart';
import 'package:ecommece2/widgets/buttonC.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBarC(
          title: Text("Added Cart"),
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: Height / 1.3,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("cards")
                      .doc(FirebaseAuth.instance.currentUser!.email)
                      .collection("card")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('Your cart is empty!'),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data!.docs[index];
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(item["d_price"])
                                  ],
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("cards")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.email)
                                            .collection("card")
                                            .doc(item.id)
                                            .delete();
                                      },
                                      icon: Icon(Icons.close)),
                                )
                              ],
                            ));
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: const Row(
                children: [Text("Total Price: ৳ 50000")],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: const ButtonC(
                  text: "Buy Now",
                  backgroundColor: Colors.green,
                ))
          ],
        ));
  }
}
