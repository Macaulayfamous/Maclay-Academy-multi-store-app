import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/views/screens/inner_screen/product_detail.dart';

class PopularModel extends StatelessWidget {
  final dynamic popularProduct;

  const PopularModel({super.key, this.popularProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(
            productData: popularProduct,
          );
        }));
      },
      child: SizedBox(
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: const Alignment(0.12, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  width: 87,
                  height: 81,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0CCFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 10,
                        top: 6,
                        child: Image.network(
                          popularProduct['productImages'][0],
                          width: 71,
                          height: 71,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              popularProduct['productName'],
              style: GoogleFonts.getFont(
                'Lato',
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Align(
              alignment: const Alignment(0.3, 0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 14,
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F4d0f16f789829bcee7eb3443bce4ecdc.png',
                        width: 12,
                        height: 12,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '4.8',
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF7F8E9D),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Container(
                      height: 14,
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F996527dac1afe0d64a51de474f348a4d.png',
                        width: 1,
                        height: 12,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '> ${popularProduct["salesCount"]} Sold',
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF7F8E9D),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),
            Align(
              alignment: const Alignment(-0.14, 0),
              child: Text(
                '\$' + popularProduct['discountPrice'].toString(),
                textAlign: TextAlign.right,
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xFF1E3354),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
