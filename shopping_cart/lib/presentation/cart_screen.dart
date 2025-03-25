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
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shopping_cart/presentation/providers/cart_provider.dart';

// class CartScreen extends ConsumerStatefulWidget {
//   const CartScreen({super.key});

//   @override
//   ConsumerState<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends ConsumerState<CartScreen> {
//   // Local state to track quantities of products
//   Map<String, int> productQuantities = {};

//   @override
//   void initState() {
//     super.initState();
//     // Initialize quantities when the screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final cartState = ref.read(cartProvider);
//       productQuantities = {
//         for (var product in cartState) product.id.toString(): 1
//       };
//     });
//   }

//   void _incrementQuantity(String productId) {
//     setState(() {
//       productQuantities[productId] = (productQuantities[productId] ?? 1) + 1;
//     });
//   }

//   void _decrementQuantity(String productId) {
//     setState(() {
//       if (productQuantities[productId] != null &&
//           productQuantities[productId]! > 1) {
//         productQuantities[productId] = productQuantities[productId]! - 1;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartState = ref.watch(cartProvider);

//     // Calculate total price considering quantities
//     double calculateTotalPrice() {
//       return cartState.fold(0.0, (sum, item) {
//         int quantity = productQuantities[item.id.toString()] ?? 1;
//         return sum + (item.price * quantity);
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//         backgroundColor: const Color.fromARGB(255, 255, 207, 223),
//         centerTitle: true,
//         elevation: 0,
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
//       ),
//       body: cartState.isEmpty
//           ? Center(
//               child:
//                   Text('Your cart is empty!', style: TextStyle(fontSize: 18)))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartState.length,
//                     itemBuilder: (context, index) {
//                       final product = cartState[index];
//                       final productId = product.id.toString();
//                       final currentQuantity = productQuantities[productId] ?? 1;

//                       return ListTile(
//                         leading: Image.network(product.thumbnail,
//                             width: 50, height: 50),
//                         title: Text(product.title),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('₹${product.price.toStringAsFixed(2)}'),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.remove_circle_outline),
//                                   onPressed: () =>
//                                       _decrementQuantity(productId),
//                                 ),
//                                 Text('$currentQuantity'),
//                                 IconButton(
//                                   icon: Icon(Icons.add_circle_outline),
//                                   onPressed: () =>
//                                       _incrementQuantity(productId),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.remove_shopping_cart,
//                               color: Colors.red),
//                           onPressed: () {
//                             ref
//                                 .read(cartProvider.notifier)
//                                 .removeFromCart(product);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Total: ₹${calculateTotalPrice().toStringAsFixed(2)}',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: cartState.isNotEmpty
//                             ? () {
//                                 // Proceed with checkout
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(SnackBar(
//                                   content: Text(
//                                       'Checkout functionality coming soon!'),
//                                   backgroundColor: Colors.pink,
//                                 ));
//                               }
//                             : null,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.pink,
//                           foregroundColor: Colors.white,
//                         ),
//                         child: Text('Check Out'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/presentation/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  Map<String, int> productQuantities = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartState = ref.read(cartProvider);
      setState(() {
        productQuantities = {
          for (var product in cartState) product.id.toString(): 1
        };
      });
    });
  }

  void _incrementQuantity(String productId) {
    setState(() {
      productQuantities[productId] = (productQuantities[productId] ?? 1) + 1;
    });
  }

  void _decrementQuantity(String productId) {
    setState(() {
      if (productQuantities[productId] != null &&
          productQuantities[productId]! > 1) {
        productQuantities[productId] = productQuantities[productId]! - 1;
      }
    });
  }

  void _deleteItem(String productId) {
    setState(() {
      productQuantities
          .remove(productId); // Remove from the local quantities map
      ref.read(cartProvider).removeWhere((product) =>
          product.id.toString() ==
          productId); // Remove the product from the local cartState
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);

    double calculateTotalPrice() {
      return cartState.fold(0.0, (sum, item) {
        int quantity = productQuantities[item.id.toString()] ?? 1;
        return sum + (item.price * quantity);
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 230, 239),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 253, 230, 239),
        elevation: 0,
        centerTitle: true,
      ),
      body: cartState.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 100, color: Colors.pink.shade200),
                  SizedBox(height: 16),
                  Text('Your cart is empty!',
                      style: TextStyle(fontSize: 18, color: Colors.black54)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: cartState.length,
                    itemBuilder: (context, index) {
                      final product = cartState[index];
                      final productId = product.id.toString();
                      final currentQuantity = productQuantities[productId] ?? 1;

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 255, 254, 254),
                              width: 1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(product.thumbnail),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),

                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      product.category,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '₹${product.price.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '₹${(product.price * 1.2).toStringAsFixed(2)}', // Original price
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Quantity Control
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[300]!),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.remove,
                                                    size: 16),
                                                onPressed: () =>
                                                    _decrementQuantity(
                                                        productId),
                                              ),
                                              Text('$currentQuantity',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              IconButton(
                                                icon: Icon(Icons.add, size: 16),
                                                onPressed: () =>
                                                    _incrementQuantity(
                                                        productId),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Delete Icon
                                        IconButton(
                                          icon: Icon(Icons.delete,
                                              color: Colors.red, size: 20),
                                          onPressed: () =>
                                              _deleteItem(productId),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                                      style: TextStyle(
                                          color: Colors.pink, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Checkout Section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount Price',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '₹${calculateTotalPrice().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: cartState.isNotEmpty
                            ? () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'Checkout functionality coming soon!'),
                                  backgroundColor: Colors.pink,
                                ));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Ensures minimal space usage
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8), // Space between text and icon
                            Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
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
