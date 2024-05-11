

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '/Feature/cart/presentation/manager/cubit/cart_cubit.dart';

import '/Feature/cart/presentation/views/widget/custom_cart_product.dart';

import '../../../data/models/all_carts_model.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



        body:  FutureBuilder<dynamic>(
          future: context.read<CartCubit>().getAllCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {

              return Center(child: Text('Happen an error ${snapshot.error}'));
            } else {

              List<AllCartsModel>? carts = context.read<CartCubit>().allCart;

              return ListView.builder(
                itemCount:carts!.length,

                itemBuilder: (context, index) {

                  AllCartsModel item=carts[index];

                  return    CustomProductCart(item:item );
                },);

          }
          },
        ),


    );
  }



}
