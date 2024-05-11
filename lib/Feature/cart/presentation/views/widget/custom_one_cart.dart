import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/sub_text.dart';

import '../../../data/models/all_carts_model.dart';
import '../../../data/models/get_single_product.dart';
import '../../manager/cubit/cart_cubit.dart';
import 'carts_widget.dart';

class CustomOneCart extends StatelessWidget {
  CustomOneCart({super.key, required this.item});
  AllCartsModel item;
  // List<GetSingleProduct> products ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: context
            .read<CartCubit>()
            .getAllProductsCart(item),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Happen An Error ${snapshot.error}'));
          } else {
            final products = snapshot.data
                as List<GetSingleProduct>;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CartsWidget(item: products[index]);
                  }),
            );
          }
        },
      ),
    );
  }
}
