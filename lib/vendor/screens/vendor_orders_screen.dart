import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/vendor/screens/inner_screen/vendor_order_detail.dart';

class VendorOrderScreen extends StatelessWidget {
  const VendorOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
        .collection('orders')
        .where('storeId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 118,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/cartb.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 61,
                  top: 51,
                  child: Text(
                    'My Orders',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Positioned(
                //   left: 23,
                //   top: 54,
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       size: 20,
                //       color: Colors.white,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _ordersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.docs.isEmpty) {
              return Center(
                  child: Text(
                'No Pending Orders Yet',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
            return ListView.builder(
                itemCount: snapshot.data!.size,
                itemBuilder: ((context, index) {
                  final orderData = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 25,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return VendorOrderDetail(
                                orderData: orderData,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 335,
                        height: 153,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 336,
                                  height: 154,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFFEFF0F2),
                                    ),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 13,
                                        top: 9,
                                        child: Container(
                                          width: 78,
                                          height: 78,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFBCC5FF),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                left: 10,
                                                top: 5,
                                                child: Image.network(
                                                  orderData['productImage'],
                                                  width: 58,
                                                  height: 67,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 101,
                                        top: 14,
                                        child: SizedBox(
                                          width: 216,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child: Text(
                                                          orderData[
                                                              'productName'],
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Lato',
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          orderData[
                                                              'productCategory'],
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Lato',
                                                            color: const Color(
                                                                0xFF7F808C),
                                                            fontSize: 12,
                                                            height: 1.6,
                                                          ),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'Size: ${orderData['size']}',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Lato',
                                                            color: const Color(
                                                                0xFF7F808C),
                                                            fontSize: 12,
                                                            height: 1.6,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                              ),
                                              Container(
                                                height: 63,
                                                alignment:
                                                    const Alignment(0, -0.07),
                                                child: Text(
                                                  '\$' +
                                                      orderData['price']
                                                          .toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Lato',
                                                    color:
                                                        const Color(0xFF0B0C1E),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.3,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 96,
                                child: Image.network(
                                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F0c22142f0880fed29e95291c0b438b13.png',
                                  width: 335,
                                  height: 1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 113,
                                child: Container(
                                  width: 77,
                                  height: 25,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: orderData['delivered'] == true
                                        ? const Color(0xFF3C55EF)
                                        : orderData['processing'] == true
                                            ? Colors.purple
                                            : Colors.red,
                                    // color: const Color(0xFF3C55EF),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 9,
                                        top: 3,
                                        child: Text(
                                          orderData['delivered'] == true
                                              ? "Delivered"
                                              : orderData['processing'] == true
                                                  ? "Processing"
                                                  : 'Cancelled',
                                          style: GoogleFonts.getFont(
                                            'Lato',
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 298,
                                top: 115,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/icons/delete.png',
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }));
          },
        ));
  }
}
