class DiscoverProductModel {
  int id;
  String productName;
  int reviewCount;
  double rating;
  double price;
  String image;
  String brand;

  DiscoverProductModel(
      {required this.id,
      required this.productName,
      required this.reviewCount,
      required this.rating,
      required this.price,
      required this.image,
      required this.brand});
}
