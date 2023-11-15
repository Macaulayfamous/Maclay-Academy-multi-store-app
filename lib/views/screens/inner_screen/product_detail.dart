import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final dynamic productData;

  const ProductDetail({Key? key, this.productData}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ValueNotifier<String> descriptionNotifier;
  bool showFullDescription = false;

  @override
  void initState() {
    super.initState();
    descriptionNotifier =
        ValueNotifier<String>(widget.productData['description']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: SizedBox(
                  width: 386,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Product Detail',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: Color(0xFF363330),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2Fdae7bac7101aca62770785afc4bf4ad0.png',
                        width: 22,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 260,
                  height: 274,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 260,
                          height: 260,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD8DDFF),
                            borderRadius: BorderRadius.circular(130),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 0,
                        child: Container(
                          width: 216,
                          height: 274,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9CA8FF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 200,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                widget.productData['productImages'].length,
                            itemBuilder: ((context, index) {
                              return Image.network(
                                widget.productData['productImages'][index],
                                width: 196,
                                height: 225,
                                fit: BoxFit.cover,
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 390,
                height: 78,
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: SizedBox(
                  width: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.productData['productName'],
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF3C55EF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.productData['category'],
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF9A9998),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Image.network(
                                'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F026720e01c32179c8c1b744927c50d03.png',
                                width: 127,
                                height: 18,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 178),
                      Container(
                        height: 78,
                        alignment: const Alignment(0, -0.59),
                        child: Text(
                          '\$${double.parse(widget.productData['discountPrice']).toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: const Color(0xFF3C55EF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 317,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      alignment: const Alignment(0, -0.2),
                      child: Text(
                        'Size :',
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: const Color(0xFF343434),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 138),
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 12,
                            top: 7,
                            child: Text(
                              'S',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                color: const Color(0xFF57636F),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color(0xFF126881),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 10,
                            top: 7,
                            child: Text(
                              'M',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                color: const Color(0xFFF6F6F7),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 11,
                            top: 7,
                            child: Text(
                              'L',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                color: const Color(0xFF57636F),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 8,
                            top: 7,
                            child: Text(
                              'XL',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                color: const Color(0xFF57636F),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'About',
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xFF363330),
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                width: 389,
                child: ValueListenableBuilder<String>(
                  valueListenable: descriptionNotifier,
                  builder: (context, description, child) {
                    return RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: const Color(0xFF797979),
                          fontSize: 12,
                          letterSpacing: 1,
                          height: 1.7,
                        ),
                        children: [
                          TextSpan(
                            text: showFullDescription
                                ? description
                                : description.substring(
                                    0, description.length ~/ 2),
                          ),
                          if (!showFullDescription)
                            TextSpan(
                              text: '... ',
                              style: TextStyle(
                                color: Color(0xFF3C54EE),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (!showFullDescription)
                            TextSpan(
                              text: 'See More',
                              style: TextStyle(
                                color: Color(0xFF3C54EE),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    showFullDescription = true;
                                  });
                                },
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 386,
          height: 48,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: const Color(0xFF3B54EE),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 148,
                top: 17,
                child: Text(
                  'ADD TO CART',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
