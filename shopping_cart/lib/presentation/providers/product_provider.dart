import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/data/datasources/product_remote_datasource.dart';
import 'package:shopping_cart/data/models/product_model.dart';

// Product Provider to fetch paginated products using FutureProvider
final productProvider = FutureProvider.family<List<ProductModel>, int>((ref, page) async {
  final productRemoteDataSource = ref.read(productRemoteDataSourceProvider);
  return await productRemoteDataSource.getProducts(page);
});
