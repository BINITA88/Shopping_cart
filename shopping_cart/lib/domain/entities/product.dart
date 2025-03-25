class Product {
  final int id;
  final String title;
  final String brand;
  final double price;
  final String category;
  final double discountPercentage;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
  });
}

// class Product {
//   final int id;
//   final String title;
//   final String description;
//   final String category;
//   final double price;
//   final double discountPercentage;
//   final double rating;
//   final int stock;
//   final List<String> tags;
//   final String brand;
//   final String sku;
//   final double weight;
//   final Dimensions dimensions;
//   final String warrantyInformation;
//   final String shippingInformation;
//   final String availabilityStatus;
//   final List<Review> reviews;
//   final String returnPolicy;
//   final int minimumOrderQuantity;
//   final MetaData meta;
//   final List<String> images;
//   final String thumbnail;

//   Product({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.tags,
//     required this.brand,
//     required this.sku,
//     required this.weight,
//     required this.dimensions,
//     required this.warrantyInformation,
//     required this.shippingInformation,
//     required this.availabilityStatus,
//     required this.reviews,
//     required this.returnPolicy,
//     required this.minimumOrderQuantity,
//     required this.meta,
//     required this.images,
//     required this.thumbnail,
//   });
// }

// class Dimensions {
//   final double width;
//   final double height;
//   final double depth;

//   Dimensions({
//     required this.width,
//     required this.height,
//     required this.depth,
//   });

//   factory Dimensions.fromJson(Map<String, dynamic> json) {
//     return Dimensions(
//       width: (json['width'] as num).toDouble(),
//       height: (json['height'] as num).toDouble(),
//       depth: (json['depth'] as num).toDouble(),
//     );
//   }
// }

// class Review {
//   final double rating;
//   final String comment;
//   final DateTime date;
//   final String reviewerName;
//   final String reviewerEmail;

//   Review({
//     required this.rating,
//     required this.comment,
//     required this.date,
//     required this.reviewerName,
//     required this.reviewerEmail,
//   });

//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       rating: (json['rating'] as num).toDouble(),
//       comment: json['comment'],
//       date: DateTime.parse(json['date']),
//       reviewerName: json['reviewerName'],
//       reviewerEmail: json['reviewerEmail'],
//     );
//   }
// }

// class MetaData {
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String barcode;
//   final String qrCode;

//   MetaData({
//     required this.createdAt,
//     required this.updatedAt,
//     required this.barcode,
//     required this.qrCode,
//   });

//   factory MetaData.fromJson(Map<String, dynamic> json) {
//     return MetaData(
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       barcode: json['barcode'],
//       qrCode: json['qrCode'],
//     );
//   }
// }
