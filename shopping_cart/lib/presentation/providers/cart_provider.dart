import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/domain/entities/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + item.price);
}
