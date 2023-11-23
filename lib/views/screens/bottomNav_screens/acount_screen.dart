import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/provider/favorite_provider.dart';
import 'package:macstore/provider/product_provider.dart';
import 'package:macstore/views/screens/inner_screen/order_screen.dart';
import 'package:macstore/views/screens/inner_screen/shipping_address_screen.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({Key? key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String fullName = '';
  String state = '';
  String city = "";

  int deliveredCount = 0;

  // int totalOrders = 0; // Initialize the variable

  @override
  void initState() {
    super.initState();
    // Call the method to set up the stream
    _setupUserDataStream();
    _setupOrdersDataStream();
    // _fetchTotalOrders(); // Call the method to fetch total orders
  }

  // void _fetchTotalOrders() async {
  //   // Fetch total orders from Firestore
  //   QuerySnapshot ordersSnapshot = await _firestore.collection('orders').get();

  //   // Update the totalOrders variable with the count of documents
  //   setState(() {
  //     totalOrders = ordersSnapshot.size;
  //   });
  // }

  void _setupUserDataStream() {
    // Create a stream of the user data
    Stream<DocumentSnapshot> userDataStream =
        _firestore.collection('users').doc(_auth.currentUser!.uid).snapshots();

    // Listen to the stream and update the UI when there's a change
    userDataStream.listen((DocumentSnapshot userData) {
      if (userData.exists) {
        setState(() {
          fullName = userData.get('fullName');
          state = userData.get('state');
          city = userData.get('city');
        });
      }
    });
  }

  void _setupOrdersDataStream() {
    // Create a stream of the user data
    Stream<QuerySnapshot> ordersDataStream = _firestore
        .collection('orders')
        .where('buyerId', isEqualTo: _auth.currentUser!.uid)
        .snapshots();

    // Listen to the stream and update the UI when there's a change
    ordersDataStream.listen((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        if (document.exists) {
          setState(() {
            deliveredCount = document.get('deliveredCount');
          });
        }
      }
    });
  }

  //retrive orders

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  void _showUpdateProfileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Profile'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                // Add widgets for updating profile photo and name
                // For example, you can use TextField for updating the name
                TextField(
                  decoration: InputDecoration(labelText: 'Enter your name'),
                  // Add controller to handle the user input
                ),
                SizedBox(height: 20),
                // Add a button to update the profile photo
                ElevatedButton(
                  onPressed: () {
                    // Implement the logic to update the profile photo
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Update Profile Photo'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProvider);
    final _favoriteProvider = ref.watch(favoriteProvider);
    int messageCount = cartData.length + _favoriteProvider.length;
    return Scaffold(
      body: Column(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            height: 450,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/FBrbGWQJqIbpA5ZHEpajYAEh1V93%2Fuploads%2Fimages%2F78dbff80_1dfe_1db2_8fe9_13f5839e17c1_bg2.png?alt=media",
                      width: MediaQuery.of(context).size.width,
                      height: 451,
                      fit: BoxFit.cover,
                    )),
                //PROFILE ICON TO UPDATE DATA

                Positioned(
                  top: 30,
                  right: 30,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.yellow.shade800,
                      ),
                      badgeContent: Text(
                        messageCount.toString(),
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      child: Image.asset(
                        'assets/icons/not.png',
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.23, -0.61),
                  child: InkWell(
                    onTap: () {},
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F3c6dbe5ebbd3a3e98465fd8659ccb1eeda1e4eb5edit%20(2)%201.png?alt=media&token=f5275f45-4272-4f0b-b20d-18f73965824d',
                      width: 19,
                      height: 19,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.53),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/FBrbGWQJqIbpA5ZHEpajYAEh1V93%2Fuploads%2Fimages%2Ff711c380_1e49_1db2_8fe9_13f5839e17c1_image.png?alt=media',
                    width: 109,
                    height: 106,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.03),
                  child: Text(
                    capitalizeFirstLetter(fullName),
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.05, 0.17),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ShippingAddressScreen();
                      }));
                    },
                    child: Text(
                      city.isEmpty ? 'enter City' : city,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.22, 0.17),
                  child: Image.network(
                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fa689e91af017cea9229561d0572a4cff.png',
                    width: 9,
                    height: 12,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: const Alignment(0.09, 0.81),
                  child: Container(
                    width: 287,
                    height: 117,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 240,
                          top: 66,
                          child: Text(
                            deliveredCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 0.4,
                              fontFamily: 'DM Sans Medium',
                            ),
                          ),
                        ),
                        Positioned(
                          left: 212,
                          top: 99,
                          child: Text(
                            'Completed',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 224,
                          top: 2,
                          child: Container(
                            width: 52,
                            height: 58,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Ff0db1e22e37c1e2a001bbb5bd4b9aafc.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 13,
                                  top: 18,
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F4ad2eb1752466c61c6bb41a0e223251a906a1a7bcorrect%201.png?alt=media&token=57abd4a6-50b4-4609-bb59-b48dce4c8cc6',
                                    width: 26,
                                    height: 26,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 130,
                          top: 66,
                          child: Text(
                            _favoriteProvider.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 0.4,
                              fontFamily: 'DM Sans Medium',
                            ),
                          ),
                        ),
                        Positioned(
                          left: 108,
                          top: 99,
                          child: Text(
                            'Favourite',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 114,
                          top: 2,
                          child: Container(
                            width: 52,
                            height: 58,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Ff0db1e22e37c1e2a001bbb5bd4b9aafc.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 18,
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F068bdad59a9aff5a9ee67737678b8d5438866afewish-list%201.png?alt=media&token=4a8abc27-022f-4a53-8f07-8c10791468e4',
                                    width: 26,
                                    height: 26,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 66,
                          child: Text(
                            cartData.length.toString(),
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          top: 99,
                          child: Text(
                            'Cart',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 56,
                            height: 63,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fe0080f58f1ec1f2200fcf329b10ce4c4.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 12,
                                  top: 15,
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fc2afb7fb33cd20f4f1aed312669aa43b8bb2d431cart%20(2)%201.png?alt=media&token=be3d8494-1ccd-4925-91f1-ee30402dfb0e',
                                    width: 33,
                                    height: 33,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
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
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderScreen();
              }));
            },
            leading: Image.asset('assets/icons/orders.png'),
            title: Text(
              'Track your order',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image.asset('assets/icons/history.png'),
            title: Text(
              'History ',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image.asset('assets/icons/help.png'),
            title: Text(
              'Help ',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () async {
              await _auth.signOut();
            },
            leading: Image.asset('assets/icons/logout.png'),
            title: Text(
              'Logout ',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
