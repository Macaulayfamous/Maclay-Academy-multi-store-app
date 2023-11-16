import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:macstore/provider/product_provider.dart';

class CartScreenProduct extends ConsumerStatefulWidget {
  const CartScreenProduct({Key? key});

  @override
  _CartScreenProductState createState() => _CartScreenProductState();
}

class _CartScreenProductState extends ConsumerState<CartScreenProduct> {
  @override
  Widget build(BuildContext context) {
    final _cartProvider = ref.read(cartProvider.notifier);
    final cartData = ref.watch(cartProvider);
    final totalAmount = ref.read(cartProvider.notifier).calculateTotalAmount();
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
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fda5eb4c298e80ff3e7e047b6765124d9e9eb5260bg%20(1)%202.png?alt=media&token=a4bbee38-27a6-4f05-8078-06b4d3346578',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: 322,
                  top: 52,
                  child: Stack(
                    children: [
                      Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fff9d75063d0d93ab7055e59bd14c4ba7.png',
                        width: 26,
                        height: 26,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: Colors.yellow.shade800,
                          ),
                          badgeContent: Text(
                            cartData.length.toString(),
                            style: GoogleFonts.lato(
                              // fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                left: 61,
                top: 51,
                child: Text(
                  'My Cart',
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 57,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F8b2b122ea25519d3a1985859a8d40079.png',
                  width: 10,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 49,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD7DDFF),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 44,
                    top: 19,
                    child: Container(
                      width: 10,
                      height: 10,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 69,
                    top: 14,
                    child: Text(
                      'You have ${cartData.length} items',
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  final cartItem = cartData.values.toList()[index];
                  return Card(
                    elevation: 1,
                    child: Container(
                      width: 375,
                      height: 220,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 22,
                            top: 49,
                            child: SizedBox(
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 19,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        cartItem.catgoryName,
                                        style: GoogleFonts.getFont(
                                          'Lato',
                                          color: const Color(0xFF444444),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 19),
                                    Container(
                                        height: 19,
                                        alignment: Alignment.bottomCenter,
                                        child: Icon(Icons.arrow_forward_ios))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 48,
                            top: 97,
                            child: Container(
                              width: 89,
                              height: 95,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    spreadRadius: 0,
                                    offset: Offset(0, 1),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: 3,
                                    top: 6,
                                    child: Image.network(
                                      cartItem.imageUrl[0],
                                      width: 82,
                                      height: 82,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 154,
                            top: 97,
                            child: SizedBox(
                              width: 154,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      cartItem.productName,
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    cartItem.catgoryName,
                                    style: TextStyle(
                                      color: Color(0xFFA1A1A1),
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '\$' +
                                          cartItem.discount.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Color(0xFFFF6464),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 254,
                            top: 164,
                            child: Container(
                              width: 101,
                              height: 28,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8F8F8),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: 46,
                                    top: 6,
                                    child: Text(
                                      cartItem.quantity.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 101,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 31,
                                            height: 28,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFDBDBDB),
                                            ),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                  left: -1,
                                                  top: -12,
                                                  child: InkWell(
                                                    onTap:
                                                        cartItem.quantity == 1
                                                            ? null
                                                            : () {
                                                                _cartProvider
                                                                    .decrementItem(
                                                                        cartItem
                                                                            .productId);
                                                              },
                                                    child: Icon(
                                                      Icons.minimize,
                                                      size: 32,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 39),
                                          Container(
                                            width: 31,
                                            height: 28,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFDBDBDB),
                                            ),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                  left: 6,
                                                  top: 4,
                                                  child: Transform.rotate(
                                                    angle: 225 * pi / 180,
                                                    child: InkWell(
                                                      onTap: () {
                                                        _cartProvider
                                                            .incrementItem(
                                                                cartItem
                                                                    .productId);
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 21,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
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
                            left: 9,
                            top: 130,
                            child: SizedBox.square(
                              dimension: 32,
                              child: Radio<String>(
                                value: '1',
                                groupValue: '1',
                                onChanged: (value) {},
                                autofocus: false,
                                splashRadius: 20,
                                activeColor: const Color(0xFF5C69E5),
                                toggleable: false,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) =>
                                        states.contains(MaterialState.selected)
                                            ? const Color(0xFF5C69E5)
                                            : Colors.grey),
                                hoverColor: const Color(0x0A000000),
                                focusColor: Colors.black12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 416,
        height: 89,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 416,
                height: 89,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFC4C4C4),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment(-0.63, -0.26),
              child: Text(
                'Subtotal ',
                style: TextStyle(
                  color: Color(0xFFA1A1A1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.19, -0.31),
              child: Text(
                '\$' + totalAmount.toStringAsFixed(2),
                style: TextStyle(
                  color: Color(0xFFFF6464),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.83, -1),
              child: Container(
                width: 166,
                height: 71,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0xFF1532E7),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Checkout',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
