import '../../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.brand,
    required super.price,
    required super.category,
    required super.discountPercentage,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      category: json['category'],
      price: json['price'] - (json['price'] * json['discountPercentage'] / 100),
      discountPercentage: json['discountPercentage'],
      thumbnail: json['thumbnail'],
    );
  }
}

// import '../../../domain/entities/product.dart';

// class ProductModel extends Product {
//   ProductModel({
//     required super.id,
//     required super.title,
//     required super.description,
//     required super.category,
//     required super.price,
//     required super.discountPercentage,
//     required super.rating,
//     required super.stock,
//     required super.tags,
//     required super.brand,
//     required super.sku,
//     required super.weight,
//     required super.dimensions,
//     required super.warrantyInformation,
//     required super.shippingInformation,
//     required super.availabilityStatus,
//     required super.reviews,
//     required super.returnPolicy,
//     required super.minimumOrderQuantity,
//     required super.meta,
//     required super.images,
//     required super.thumbnail,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       category: json['category'],
//       price: json['price'] - (json['price'] * json['discountPercentage'] / 100),
//       discountPercentage: json['discountPercentage'],
//       rating: json['rating'],
//       stock: json['stock'],
//       tags: List<String>.from(json['tags']),
//       brand: json['brand'],
//       sku: json['sku'],
//       weight: json['weight'],
//       // dimensions: Dimensions.fromJson(json['dimensions']),
//       warrantyInformation: json['warrantyInformation'],
//       shippingInformation: json['shippingInformation'],
//       availabilityStatus: json['availabilityStatus'],
//       // reviews: (json['reviews'] as List)
//       //     .map((review) => Review.fromJson(review))
//       //     .toList(),
//       returnPolicy: json['returnPolicy'],
//       minimumOrderQuantity: json['minimumOrderQuantity'],
//       // meta: Meta.fromJson(json['meta']),
//       images: List<String>.from(json['images']),
//       thumbnail: json['thumbnail'], dimensions: json['dimensions'], reviews: [],
//       meta: json['meta'],
//     );
//   }
// }

// class Dimensions {
//   final double width;
//   final double height;
//   final double depth;

//   Dimensions({required this.width, required this.height, required this.depth});

//   factory Dimensions.fromJson(Map<String, dynamic> json) {
//     return Dimensions(
//       width: json['width'].toDouble(),
//       height: json['height'].toDouble(),
//       depth: json['depth'].toDouble(),
//     );
//   }
// }

// class Review {
//   final int rating;
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
//       rating: json['rating'],
//       comment: json['comment'],
//       date: DateTime.parse(json['date']),
//       reviewerName: json['reviewerName'],
//       reviewerEmail: json['reviewerEmail'],
//     );
//   }
// }

// class Meta {
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String barcode;
//   final String qrCode;

//   Meta({
//     required this.createdAt,
//     required this.updatedAt,
//     required this.barcode,
//     required this.qrCode,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) {
//     return Meta(
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       barcode: json['barcode'],
//       qrCode: json['qrCode'],
//     );
//   }
// }
