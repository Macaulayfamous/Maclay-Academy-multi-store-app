import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorOrderDetail extends StatefulWidget {
  final dynamic orderData;

  VendorOrderDetail({super.key, this.orderData});

  @override
  State<VendorOrderDetail> createState() => _VendorOrderDetailState();
}

class _VendorOrderDetailState extends State<VendorOrderDetail> {
  double rating = 0;

  final TextEditingController _reviewTextController = TextEditingController();

  Future<void> markAsDelivered() async {
    try {
      // Update 'delivered' status to true and increment 'deliveredCount' in Firestore
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(widget.orderData['orderId'])
          .update({
        'delivered': true,
        'deliveredCount': FieldValue.increment(1),
      });

      // You might want to show a confirmation message to the user
    } catch (error) {
      print('Error marking order as delivered: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF3C55EF),
        ),
        title: Text(
          widget.orderData['productName'],
        ),
      ),
      body: Column(
        children: [
          Container(
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 5,
                                    child: Image.network(
                                      widget.orderData['productImage'],
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
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'Hoddie',
                                              style: GoogleFonts.getFont(
                                                'Lato',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 4),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              widget
                                                  .orderData['productCategory'],
                                              style: GoogleFonts.getFont(
                                                'Lato',
                                                color: const Color(0xFF7F808C),
                                                fontSize: 12,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 2),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Size: ${widget.orderData['size']}',
                                              style: GoogleFonts.getFont(
                                                'Lato',
                                                color: const Color(0xFF7F808C),
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
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Container(
                                    height: 63,
                                    alignment: const Alignment(0, -0.07),
                                    child: Text(
                                      '\$' +
                                          widget.orderData['price'].toString(),
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        color: const Color(0xFF0B0C1E),
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
                        color: widget.orderData['delivered'] == true
                            ? const Color(0xFF3C55EF)
                            : widget.orderData['processing'] == true
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
                              widget.orderData['delivered'] == true
                                  ? "Delivered"
                                  : widget.orderData['processing'] == true
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
                          // Positioned(
                          //   left: 0,
                          //   top: 0,
                          //   child: InkWell(
                          //     onTap: () {},
                          //     child: Image.asset(
                          //       'assets/icons/delete.png',
                          //       width: 20,
                          //       height: 20,
                          //       fit: BoxFit.contain,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Delivery Address',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.orderData['locality'] +
                              widget.orderData['pinCode'],
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.orderData['city'] + widget.orderData['state'],
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'To' + " " + widget.orderData['fullName'],
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: widget.orderData['delivered'] == true
                ? null
                : () {
                    markAsDelivered();
                  },
            child: widget.orderData['delivered'] == true
                ? Text('Delivered')
                : Text(
                    'Mark as Delivered',
                  ),
          )
        ],
      ),
    );
  }
}
