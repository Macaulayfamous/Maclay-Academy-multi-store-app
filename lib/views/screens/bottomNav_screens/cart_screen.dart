import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CartScreen Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Frame2(),
          Group3(),
        ],
      )),
    );
  }
}

class Group3 extends StatelessWidget {
  const Group3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'You have 3 items',
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
    );
  }
}

class Frame2 extends StatelessWidget {
  const Frame2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            left: 322,
            top: 52,
            child: Image.asset(
              'assets/icons/not.png',
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
          ),
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
    );
  }
}
