import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macstore/provider/favorite_provider.dart';
import 'package:macstore/views/screens/inner_screen/product_detail.dart';

class ProductModel extends ConsumerStatefulWidget {
  final dynamic productData;

  ProductModel({super.key, this.productData});

  @override
  _ProductModelState createState() => _ProductModelState();
}

class _ProductModelState extends ConsumerState<ProductModel> {
  @override
  Widget build(BuildContext context) {
    final _favoriteProvider = ref.read(favoriteProvider.notifier);
    ref.watch(favoriteProvider);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(
            productData: widget.productData,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: 146,
          height: 245,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 146,
                  height: 245,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0F040828),
                        spreadRadius: 0,
                        offset: Offset(0, 18),
                        blurRadius: 30,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 130,
                child: Text(
                  widget.productData['productName'].toString(),
                  style: TextStyle(
                    color: Color(0xFF1E3354),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 177,
                child: Text(
                  widget.productData['productName'],
                  style: TextStyle(
                    color: Color(0xFF7F8E9D),
                    fontSize: 12,
                    letterSpacing: 0.2,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 207,
                child: Text(
                  '\$' + widget.productData['discountPrice'].toString(),
                  style: TextStyle(
                    color: Color(0xFF1E3354),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 210,
                child: Text(
                  '\$' + widget.productData['price'].toString(),
                  style: TextStyle(
                    color: Color(0xFFFA634D),
                    fontSize: 16,
                    letterSpacing: 0.3,
                    decoration: TextDecoration.lineThrough,
                    fontFamily: 'Lato',
                  ),
                ),
                
              ),
              Positioned(
                left: 9,
                top: 9,
                child: Container(
                  width: 128,
                  height: 108,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -1,
                        top: -1,
                        child: Container(
                          width: 130,
                          height: 110,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF5C3),
                            border: Border.all(
                              width: 0.8,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 4,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE44F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 4,
                        child: Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: -10,
                          child: CachedNetworkImage(
                            imageUrl: widget.productData['productImages'][0],
                            width: 108,
                            height: 107,
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 155,
                child: Text(
                  '> ${widget.productData['salesCount']} Sold',
                  style: TextStyle(
                    color: Color(0xFF7F8E9D),
                    fontSize: 12,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              if (widget.productData != null &&
                  widget.productData.data().containsKey('rating'))
                widget.productData['rating'] == 0
                    ? Text("")
                    : Positioned(
                        left: 23,
                        top: 155,
                        child: Text(
                          widget.productData['rating'].toString(),
                          style: TextStyle(
                            color: Color(0xFF7F8E9D),
                            fontSize: 12,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
              Positioned(
                left: 8,
                top: 156,
                child: Opacity(
                  opacity: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC9C9C9),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 158,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FoWHqAkkBQtCIoAn9Tb3B%2F4d0f16f789829bcee7eb3443bce4ecdc.png',
                  width: 12,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 49,
                top: 158,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FoWHqAkkBQtCIoAn9Tb3B%2F7c694699660ce7db507c54856763330b.png',
                  width: 1,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 104,
                top: 15,
                child: Container(
                  width: 27,
                  height: 27,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFA634D),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33FF2000),
                        spreadRadius: 0,
                        offset: Offset(0, 7),
                        blurRadius: 15,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: IconButton(
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
                          color: Colors.white,
                          size: 16,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 16,
                        ),
                ),
              ),
              Positioned(
                left: 108,
                top: 215,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FoWHqAkkBQtCIoAn9Tb3B%2F59d79aa11da13cace795d3cac0f6abb6.png',
                  width: 38,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 117,
                top: 223,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FoWHqAkkBQtCIoAn9Tb3B%2F0fe374b84129697e378d97d72e2cc899.png',
                  width: 18,
                  height: 17,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
