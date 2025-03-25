// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart'; // Using Riverpod for state management
// import 'package:shopping_cart/presentation/providers/cart_provider.dart';
// import 'package:shopping_cart/presentation/providers/product_provider.dart';

// class HomeScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productList = ref.watch(
//         productProvider(0)); // Watch the product provider for the first page

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(
//                   context, '/cart'); // Navigate to the cart screen
//             },
//           ),
//         ],
//       ),
//       body: productList.when(
//         data: (products) {
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return ListTile(
//                 leading: Image.network(product.thumbnail,
//                     width: 50, height: 50), // Product image
//                 title: Text(product.title),
//                 subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     ref
//                         .read(cartProvider.notifier)
//                         .addToCart(product); // Add product to the cart
//                   },
//                   child: Text('Add to Cart'),
//                 ),
//               );
//             },
//           );
//         },
//         loading: () =>
//             Center(child: CircularProgressIndicator()), // Show loading spinner
//         error: (error, stack) =>
//             Center(child: Text('Error loading products')), // Error message
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shopping_cart/presentation/providers/cart_provider.dart';
// import 'package:shopping_cart/presentation/providers/product_provider.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productList = ref.watch(productProvider(0));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Catalogue'),
//         backgroundColor: Colors.pink.shade100,
//         actions: [
//           IconButton(
//             icon: Stack(
//               children: [
//                 Icon(Icons.shopping_cart, color: Colors.black),
//                 Positioned(
//                   right: 0,
//                   child: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.red,
//                     child: Text(
//                       ref.watch(cartProvider).length.toString(),
//                       style: TextStyle(fontSize: 10, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () => Navigator.pushNamed(context, '/cart'),
//           ),
//         ],
//       ),
//       body: productList.when(
//         data: (products) {
//           return GridView.builder(
//             padding: EdgeInsets.all(10),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.75,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return Card(
//                 color: Colors.pink.shade50,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child:
//                           Image.network(product.thumbnail, fit: BoxFit.cover),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(product.title,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text(
//                               '₹${product.discountPercentage.toStringAsFixed(2)}',
//                               style: TextStyle(color: Colors.black54)),
//                           Text('₹${product.price.toStringAsFixed(2)}',
//                               style: TextStyle(color: Colors.black54)),
//                           SizedBox(height: 5),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: ElevatedButton(
//                               onPressed: () => ref
//                                   .read(cartProvider.notifier)
//                                   .addToCart(product),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.pink,
//                               ),
//                               child: Text('Add'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error loading products')),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shopping_cart/presentation/providers/cart_provider.dart';
// import 'package:shopping_cart/presentation/providers/product_provider.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   // Function to calculate discounted price
//   double calculateDiscountedPrice(
//       double originalPrice, double discountPercentage) {
//     return originalPrice * (1 - discountPercentage / 100);
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productList = ref.watch(productProvider(0));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Catalogue'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//         actions: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart, color: Colors.black),
//                 onPressed: () => Navigator.pushNamed(context, '/cart'),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: CircleAvatar(
//                   radius: 8,
//                   backgroundColor: Colors.red,
//                   child: Text(
//                     ref.watch(cartProvider).length.toString(),
//                     style: TextStyle(fontSize: 10, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: productList.when(
//         data: (products) {
//           return GridView.builder(
//             padding: EdgeInsets.all(8),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 8,
//               mainAxisSpacing: 8,
//               childAspectRatio: 0.65,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];

//               // Calculate discounted price
//               final discountedPrice = calculateDiscountedPrice(
//                   product.price, product.discountPercentage);

//               return Card(
//                 elevation: 1,
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(10)),
//                       child: Image.network(
//                         product.thumbnail,
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.title,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             '${product.discountPercentage.toStringAsFixed(0)}% OFF',
//                             style: TextStyle(
//                               color: Colors.pink,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 '₹${discountedPrice.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 '₹${product.price.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   color: Colors.black54,
//                                   fontSize: 12,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: ElevatedButton(
//                               onPressed: () => ref
//                                   .read(cartProvider.notifier)
//                                   .addToCart(product),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.pink.shade400,
//                                 minimumSize: Size(70, 30),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 6),
//                               ),
//                               child: Text(
//                                 'Add',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error loading products')),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/presentation/providers/cart_provider.dart';
import 'package:shopping_cart/presentation/providers/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // Function to calculate discounted price
  double calculateDiscountedPrice(
      double originalPrice, double discountPercentage) {
    return originalPrice * (1 - discountPercentage / 100);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productProvider(0));

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
        backgroundColor: const Color.fromARGB(255, 255, 207, 223),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    ref.watch(cartProvider).length.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: productList.when(
        data: (products) {
          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              // Calculate discounted price
              final discountedPrice = calculateDiscountedPrice(
                  product.price, product.discountPercentage);

              return Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        product.thumbnail,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            product.brand,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '₹${discountedPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '₹${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .addToCart(product),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink.shade400,
                                minimumSize: Size(70, 30),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading products')),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 207, 223),
    );
  }
}
