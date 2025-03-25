// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shopping_cart/presentation/providers/cart_provider.dart';

// class CartScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cart = ref.watch(cartProvider); // Watch the cart state

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final product = cart[index];
//                 return ListTile(
//                   leading: Image.network(product.thumbnail,
//                       width: 50, height: 50), // Product image
//                   title: Text(product.title),
//                   subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.remove_circle),
//                     onPressed: () {
//                       ref
//                           .read(cartProvider.notifier)
//                           .removeFromCart(product); // Remove product from cart
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                     'Total: ₹${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}'),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle checkout logic
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text('Checkout functionality coming soon!')),
//                     );
//                   },
//                   child: Text('Checkout'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/presentation/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider); // Watch the cart state

    return Scaffold(
      appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: const Color.fromARGB(255, 255, 207, 223),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
      body: cartState.isEmpty
          ? Center(
              child:
                  Text('Your cart is empty!', style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartState.length,
                    itemBuilder: (context, index) {
                      final product = cartState[index];
                      return ListTile(
                        leading: Image.network(product.thumbnail,
                            width: 50, height: 50),
                        title: Text(product.title),

                        subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
                        // subtitle: Text(
                        //       '₹${product.discountPercentage.toStringAsFixed(2)}',
                        //       style: TextStyle(color: Colors.black54)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_shopping_cart,
                              color: Colors.red),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Total: ₹${cartState.fold(0.0, (double sum, item) => sum + item.price).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (cartState.isNotEmpty) {
                            // Proceed with checkout
                          }
                        },
                        child: Text('Check Out'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
