import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/views/screens/inner_screen/store_detail_screen.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _storesStream =
        FirebaseFirestore.instance.collection('vendors').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _storesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 80, left: 40),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Store Owners',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        final storeData = snapshot.data!.docs[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return StoreDetailScreen(
                                storeData: storeData,
                              );
                            }));
                          },
                          child: ListTile(
                            title: Text(
                              storeData['companyName'],
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                storeData['storeImage'],
                              ),
                            ),
                          ),
                        );
                      })),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
