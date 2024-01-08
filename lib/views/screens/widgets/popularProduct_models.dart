import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/views/screens/inner_screen/product_detail.dart';

class PopularModel extends StatelessWidget {
  final dynamic popularProduct;

  const PopularModel({Key? key, required this.popularProduct})
      : super(key: key);

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
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 87,
                height: 81,
                decoration: BoxDecoration(
                  color: const Color(0xFFB0CCFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  popularProduct['productImages'][0],
                  width: 71,
                  height: 71,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$' + popularProduct['discountPrice'].toString(),
              style: TextStyle(
                color: Color(0xFF1E3354),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                fontFamily: 'Lato',
              ),
            ),
            Text(
              popularProduct['productName'],
              style: GoogleFonts.getFont(
                'Lato',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
