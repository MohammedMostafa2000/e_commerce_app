class ProductDM {
  int? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  List<String>? availableColors;
  String? imageCover;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDM({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.availableColors,
    this.imageCover,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) {
    return ProductDM(
      sold: json['sold'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'] ?? json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      availableColors:
          json['availableColors'] != null ? List<String>.from(json['availableColors']) : null,
      imageCover: json['imageCover'],
      ratingsAverage:
          json['ratingsAverage'] != null ? (json['ratingsAverage'] as num).toDouble() : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
