class PropertyModel {
  final String address;
  final int id;
  final String image;
  double longitude;
  double latitude;
  double price;

  PropertyModel({
    required this.address,
    required this.id,
    required this.image,
    required this.longitude,
    required this.latitude,
    required this.price,
  });
}
