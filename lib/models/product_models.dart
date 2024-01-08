class CartModel {
  final String productName;
  final num productPrice;
  final String catgoryName;
  final List imageUrl;
  final String storeId;
  int quantity;
  final String productId;
  final String productSize;
  final num discount;
  final String description;

  CartModel(
      {required this.productName,
      required this.productPrice,
      required this.catgoryName,
      required this.imageUrl,
      required this.quantity,
      required this.productId,
      required this.productSize,
      required this.discount,
      required this.description, required this.storeId});
}
