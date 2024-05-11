//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:smile_shop/Feature/cart/presentation/manager/provider/cart_provider.dart';
//
// import '../../../../../core/cache_helper/cache_helper.dart';
// import '../../../../product/data/data/model/all_product_model.dart';
// import 'custom_cart_product.dart';
//
// void showCart(context) async {
//   List<AllProductMdel>loadedCartItems =await cacheHelper.loadCart();
//   // await loadCart();
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.grey.shade100,
//         title: Text('My Carts'),
//         content: SizedBox(
//           width: double.maxFinite,
//           child: ListView.builder(
//             itemCount: loadedCartItems.length,
//             itemBuilder: (context, index) {
//               final item = loadedCartItems[index];
//               return CustomProductCart(item: item,);
//
//             },
//           ),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             child: Text('Exite'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ), ElevatedButton(
//             child: Text('Delete'),
//             onPressed: () {
//               cacheHelper.clearCart();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }