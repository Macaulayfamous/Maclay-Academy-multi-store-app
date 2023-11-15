import 'package:flutter/material.dart';
import 'package:macstore/views/screens/widgets/popularProduct_models.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection(
          'products',
        )
        .where(
          'popular',
          isEqualTo: true,
        )
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 300 / 500,
            children: List.generate(snapshot.data!.size, (index) {
              final popularProduct = snapshot.data!.docs[index];
              return PopularModel(
                popularProduct: popularProduct,
              );
            }),
          ),
        );
      },
    );
  }
}
