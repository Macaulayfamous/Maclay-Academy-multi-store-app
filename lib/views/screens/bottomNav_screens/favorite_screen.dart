import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:macstore/provider/favorite_provider.dart';
import 'package:macstore/views/screens/main_screen.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _favoriteProvider = ref.read(favoriteProvider.notifier);
    final _wishItem = ref.watch(favoriteProvider);
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
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/icons/not.png',
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
                              _wishItem.length.toString(),
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
                    'My Favorite ',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Positioned(
                //   left: 23,
                //   top: 57,
                //   child: Image.asset(
                //     'assets/icons/arrow.png',
                //     width: 10,
                //     height: 12,
                //     fit: BoxFit.contain,
                //   ),
                // )
              ],
            ),
          ),
        ),
        body: _wishItem.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'your wishlist is empty\n you can add product to your wishlist from the button',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        letterSpacing: 1.7,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      },
                      child: Text('Add Item'),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _wishItem.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final wishData = _wishItem.values.toList()[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        width: 335,
                        height: 96,
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
                                  height: 97,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFFEFF0F2),
                                    ),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
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
                                ),
                              ),
                              Positioned(
                                left: 275,
                                top: 16,
                                child: Text(
                                  '\$' + wishData.price.toStringAsFixed(2),
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF0B0C1E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 101,
                                top: 14,
                                child: SizedBox(
                                  width: 162,
                                  child: Text(
                                    wishData.productName,
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 101,
                                top: 37,
                                child: Text(
                                  'Winter Cloths',
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF7F808C),
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 101,
                                top: 56,
                                child: Text(
                                  'Size: ${wishData.productSize}',
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFF7F808C),
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 23,
                                top: 14,
                                child: Image.network(
                                  wishData.imageUrl[0],
                                  width: 58,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 284,
                                top: 47,
                                child: InkWell(
                                  onTap: () {
                                    _favoriteProvider
                                        .removeItem(wishData.productId);
                                  },
                                  child: Image.asset(
                                    'assets/icons/delete.png',
                                    width: 28,
                                    height: 28,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }));
  }
}
