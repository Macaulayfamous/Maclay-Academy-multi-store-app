import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macstore/controllers/banners_controller.dart';

class BannerArea extends StatelessWidget {
  const BannerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BannerController bannerController = Get.find<BannerController>();

    // Calculate responsive spacing based on screen width
    double spacing = MediaQuery.of(context).size.width < 600 ? 16.0 : 32.0;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170, // Adjust the banner height as needed
      padding: EdgeInsets.symmetric(horizontal: spacing),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // Add a subtle shadow
          ),
        ],
      ),
      child: StreamBuilder<List<String>>(
        stream: bannerController.getBannerUrls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            print('Error fetching banners: ${snapshot.error}');
            return Icon(Icons.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            print('No banners found.');
            return Center(
              child: Text(
                'No banners available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          } else {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: BannerWidget(
                        imageUrl: snapshot.data![index],
                      ),
                    );
                  },
                ),
                _buildPageIndicator(snapshot.data!.length),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildPageIndicator(int pageCount) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, // Indicator color
            ),
          );
        }),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final String imageUrl;

  BannerWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
        ),
      ),
    );
  }
}
