class FavoriteModel {
  final String productName;
  final String productId;
  final List imageUrl;

  final num price;

  final List productSize;

  FavoriteModel({
    required this.productName,
    required this.productId,
    required this.imageUrl,
    required this.price,
    required this.productSize,
  });
}
