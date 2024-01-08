import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macstore/vendor/screens/product_tap/published_tab.dart';
import 'package:macstore/vendor/screens/product_tap/unpushlised_product_screen.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF2141E5),
          title: Text(
            'Manage Products',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Published',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Unpublished',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            PublishedTab(),
            UnPublishedTab(),
          ],
        ),
      ),
    );
  }
}
