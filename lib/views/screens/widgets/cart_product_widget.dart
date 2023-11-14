import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class CartScreenProduct extends StatelessWidget {
  const CartScreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                width: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 19,
                      alignment: Alignment.topCenter,
                      child: Text(
                        'bestshop',
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: const Color(0xFF444444),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 19),
                    Container(
                      height: 19,
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F0ab1ff0f3814899facd18e913c2a391c.png',
                        width: 12,
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
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
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fe3cda05eab2fe4a9981b35644430255b94d691abUntitled-1-01-27-scaled-removebg-preview%201.png?alt=media&token=98af091d-1909-4f69-ac4c-f4f7680ec32c',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mouse Logitech g12',
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'wireless, battery long life',
                      style: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\$12',
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
                    const Positioned(
                      left: 46,
                      top: 6,
                      child: Text(
                        '1',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 31,
                              height: 28,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDBDBDB),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: -1,
                                    top: -12,
                                    child: Icon(
                                      Icons.minimize,
                                      size: 32,
                                      color: Colors.black,
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
                                      child: const Icon(
                                        Icons.close,
                                        size: 21,
                                        color: Colors.black,
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
              left: 0,
              top: 219,
              child: Image.network(
                'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F3ecb37be4be3d60f7536bf00493dab05.png',
                width: 375,
                height: 2,
                fit: BoxFit.contain,
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
                  fillColor: MaterialStateProperty.resolveWith((states) =>
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
  }
}
