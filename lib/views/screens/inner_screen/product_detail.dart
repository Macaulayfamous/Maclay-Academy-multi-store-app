import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/provider/favorite_provider.dart';
import 'package:macstore/provider/product_provider.dart';
import 'package:macstore/provider/size_provider.dart';
import 'package:macstore/views/screens/widgets/product_models.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart' as rate;

class ProductDetail extends ConsumerStatefulWidget {
  final dynamic productData;

  const ProductDetail({Key? key, this.productData}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
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
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where(
          'category',
          isEqualTo: widget.productData['category'],
        )
        .snapshots();
    final _favoriteProvider = ref.read(favoriteProvider.notifier);
    ref.watch(favoriteProvider);
    final _cartProvider = ref.read(cartProvider.notifier);
    final cartItem = ref.watch(cartProvider);
    final isInCart = cartItem.containsKey(widget.productData['productId']);
    final selectedSize = ref.watch(selectedSizeProvider);
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
                      IconButton(
                        onPressed: () {
                          _favoriteProvider.addProuctToFavorite(
                              productName: widget.productData['productName'],
                              productId: widget.productData['productId'],
                              imageUrl: widget.productData['productImages'],
                              price: widget.productData['price'],
                              productSize: widget.productData['productSize']);
                        },
                        icon: _favoriteProvider.getFavoriteItem
                                .containsKey(widget.productData['productId'])
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,

                                // size: 16,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                // size: 16,
                              ),
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
                          height: 300,
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
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              // const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.productData['category'],
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF9A9998),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              if (widget.productData
                                  .data()
                                  .containsKey('rating'))
                                rate.RatingBar.readOnly(
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  initialRating: widget.productData['rating'],
                                  maxRating: 5,
                                  size: 18,
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
                          '\$${widget.productData['discountPrice'].toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: const Color(0xFF3C55EF),
                            fontSize: 17,
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
                    widget.productData['productSize'].isEmpty
                        ? Text('')
                        : Container(
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
                    // SizedBox(
                    //   width: 138,
                    // ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.productData['productSize'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  final newSelected =
                                      widget.productData['productSize'][index];

                                  ref
                                      .read(selectedSizeProvider.notifier)
                                      .setSelectedSize(newSelected);
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: selectedSize ==
                                            widget.productData['productSize']
                                                [index]
                                        ? Color(0xFFF6F6F7)
                                        : const Color(0xFF126881),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.productData['productSize'][index],
                                      style: GoogleFonts.quicksand(
                                        color: selectedSize ==
                                                widget.productData[
                                                    'productSize'][index]
                                            ? Colors.black
                                            : Color(0xFFF6F6F7),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Related Products',
                style: GoogleFonts.roboto(
                  fontSize: 17,
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _productsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final productData = snapshot.data!.docs[index];
                        return ProductModel(
                          productData: productData,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: isInCart
              ? null
              : () {
                  _cartProvider.addProductToCart(
                    productName: widget.productData['productName'],
                    productPrice: widget.productData['price'],
                    catgoryName: widget.productData['category'],
                    imageUrl: widget.productData['productImages'],
                    quantity: 1,
                    productId: widget.productData['productId'],
                    productSize: selectedSize,
                    discount: widget.productData['discountPrice'],
                    description: widget.productData['description'],
                    storeId: widget.productData['storeId'],
                  );

                  print(_cartProvider.getCartItems.values.first.productName);
                },
          child: Container(
            width: 386,
            height: 48,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: isInCart ? Colors.grey : const Color(0xFF3B54EE),
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
      ),
    );
  }
}
