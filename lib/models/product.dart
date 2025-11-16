class Product {
  final String id;
  final String name;
  final String location;
  final int price; // IDR
  final String imageAsset;
  final bool isNew;

  const Product({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.imageAsset,
    required this.isNew,
  });
}
