import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/presentation/providers/product_provider.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider(0)); // Example: Page 0

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: products.when(
        data: (productList) {
          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ListTile(
                leading: Image.network(product.thumbnail),
                title: Text(product.title),
                subtitle: Text('${product.brand} - ₹${product.price.toStringAsFixed(2)}'),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Failed to load products')),
      ),
    );
  }
}
