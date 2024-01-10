import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/views/screens/widgets/popularProduct_models.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class StoreDetailScreen extends StatelessWidget {
  final dynamic storeData;

  const StoreDetailScreen({super.key, this.storeData});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('vendors');

    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection(
          'products',
        )
        .where(
          'storeId',
          isEqualTo: storeData['storeId'],
        )
        .snapshots();

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(storeData['storeId']).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(data['storeImage']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['companyName'] + " " + "Store",
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream: _productsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Scaffold(
                        body: Center(
                            child: CircularProgressIndicator(
                      color: Colors.blue,
                    )));
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Material(
                      child: Center(
                        child: Text(
                          'no product uploaded under this store\ncheck back later',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
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
              ),
            );
          }

          return Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        },
      ),
    );
  }
}
