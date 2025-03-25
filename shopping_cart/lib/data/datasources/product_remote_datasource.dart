// import 'package:http/http.dart' as http;
// import 'package:shopping_cart/models/product_model.dart';
// import 'dart:convert';


// abstract class ProductRemoteDataSource {
//   Future<List<ProductModel>> getProducts(int page);
// }

// class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
//   final http.Client client;

//   ProductRemoteDataSourceImpl(this.client);

//   @override
//   Future<List<ProductModel>> getProducts(int page) async {
//     final response = await client.get(Uri.parse('https://dummyjson.com/products?limit=10&skip=${page * 10}'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body)['products'];
//       return data.map((json) => ProductModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/data/models/product_model.dart';
import 'dart:convert';

// Define an abstract class for data source
abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts(int page);
}

// Implementation class for the ProductRemoteDataSource
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts(int page) async {
    final response = await client.get(
        Uri.parse('https://dummyjson.com/products?limit=10&skip=${page * 10}'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

// Define a provider for the data source
final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(http.Client());
});
